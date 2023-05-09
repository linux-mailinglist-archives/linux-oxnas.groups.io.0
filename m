Return-Path: <bounce+16102+291+1808289+3934443@groups.io>
X-Original-To: lists+linux-oxnas@lfdr.de
Delivered-To: lists+linux-oxnas@lfdr.de
Received: from mail02.groups.io (mail02.groups.io [66.175.222.108])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E86FCB37
	for <lists+linux-oxnas@lfdr.de>; Tue,  9 May 2023 18:19:25 +0200 (CEST)
X-Received: by 127.0.0.2 with SMTP id rJGtYY1809624xJkV9fFlDps; Tue, 09 May 2023 09:19:23 -0700
X-Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.28921.1683630032844666575
 for <linux-oxnas@groups.io>;
 Tue, 09 May 2023 04:00:33 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349929596"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="349929596"
X-Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 04:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="945243629"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="945243629"
X-Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 May 2023 04:00:09 -0700
X-Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwL4j-00026e-27;
	Tue, 09 May 2023 11:00:09 +0000
Date: Tue, 9 May 2023 18:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhe <sensor1010@163.com>, marcan@marcan.st, sven@svenpeter.dev,
	alyssa@rosenzweig.io, linus.walleij@linaro.org,
	neil.armstrong@linaro.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
	Lizhe <sensor1010@163.com>
Subject: Re: [linux-oxnas] [PATCH] dirvers/pinctrl.c : using pinctrl_dev->dev to obtain struct device * dev
Message-ID: <202305091858.pJaUy3Gt-lkp@intel.com>
References: <20230508154043.11859-1-sensor1010@163.com>
MIME-Version: 1.0
In-Reply-To: <20230508154043.11859-1-sensor1010@163.com>
Precedence: Bulk
List-Unsubscribe: <mailto:linux-oxnas+unsubscribe@groups.io>
List-Subscribe: <mailto:linux-oxnas+subscribe@groups.io>
List-Help: <mailto:linux-oxnas+help@groups.io>
Sender: linux-oxnas@groups.io
List-Id: <linux-oxnas.groups.io>
Mailing-List: list linux-oxnas@groups.io; contact linux-oxnas+owner@groups.io
Delivered-To: mailing list linux-oxnas@groups.io
Reply-To: linux-oxnas@groups.io,lkp@intel.com
X-Gm-Message-State: UuZTrU92tTRAbibVlMFnMBbfx1808289AA=
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=groups.io;
 q=dns/txt; s=20140610; t=1683649163;
 bh=305d7zNbNo5LQB1rIKhvcs/H8+zh8QEkp+2/effYMLI=;
 h=Cc:Content-Type:Date:From:Reply-To:Subject:To;
 b=YezGXDqL4OXa1sOZPeJV3236Hxcd3cmifuauSzokF4vKXDn5zMldvZehT43agST+SYy
 ZbU/Cxc+WbFDC7eNhM5lI5N5nlEK2GKUvK0rkCUa0Ti5QU+jdUrz2IdULuvHzMP+5+5sI
 EnuOz4AFW98BjY3OYz5GXToq2SIBFpcJxPw=

Hi Lizhe,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhe/dirvers-pinctrl-c-using-pinctrl_dev-dev-to-obtain-struct-device-dev/20230508-234502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230508154043.11859-1-sensor1010%40163.com
patch subject: [PATCH] dirvers/pinctrl.c : using pinctrl_dev->dev to obtain struct device * dev
config: i386-randconfig-a001-20230508 (https://download.01.org/0day-ci/archive/20230509/202305091858.pJaUy3Gt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/83751a28d7f5223597b6742300796fb80362dc20
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lizhe/dirvers-pinctrl-c-using-pinctrl_dev-dev-to-obtain-struct-device-dev/20230508-234502
        git checkout 83751a28d7f5223597b6742300796fb80362dc20
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091858.pJaUy3Gt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-stmfx.c:714:11: error: use of undeclared identifier 'pctldev'
                   dev_err(pctldev->dev, "gpio_chip registration failed\n");
                           ^
   drivers/pinctrl/pinctrl-stmfx.c:727:11: error: use of undeclared identifier 'pctldev'
                   dev_err(pctldev->dev, "cannot request irq%d\n", irq);
                           ^
   drivers/pinctrl/pinctrl-stmfx.c:731:11: error: use of undeclared identifier 'pctldev'
           dev_info(pctldev->dev,
                    ^
   3 errors generated.


vim +/pctldev +714 drivers/pinctrl/pinctrl-stmfx.c

   638	
   639	static int stmfx_pinctrl_probe(struct platform_device *pdev)
   640	{
   641		struct stmfx *stmfx = dev_get_drvdata(pdev->dev.parent);
   642		struct device_node *np = pdev->dev.of_node;
   643		struct stmfx_pinctrl *pctl;
   644		struct gpio_irq_chip *girq;
   645		int irq, ret;
   646	
   647		pctl = devm_kzalloc(stmfx->dev, sizeof(*pctl), GFP_KERNEL);
   648		if (!pctl)
   649			return -ENOMEM;
   650	
   651		platform_set_drvdata(pdev, pctl);
   652	
   653		pctl->dev = &pdev->dev;
   654		pctl->stmfx = stmfx;
   655	
   656		if (!of_property_present(np, "gpio-ranges")) {
   657			dev_err(pctl->dev, "missing required gpio-ranges property\n");
   658			return -EINVAL;
   659		}
   660	
   661		irq = platform_get_irq(pdev, 0);
   662		if (irq <= 0)
   663			return -ENXIO;
   664	
   665		mutex_init(&pctl->lock);
   666	
   667		/* Register pin controller */
   668		pctl->pctl_desc.name = "stmfx-pinctrl";
   669		pctl->pctl_desc.pctlops = &stmfx_pinctrl_ops;
   670		pctl->pctl_desc.confops = &stmfx_pinconf_ops;
   671		pctl->pctl_desc.pins = stmfx_pins;
   672		pctl->pctl_desc.npins = ARRAY_SIZE(stmfx_pins);
   673		pctl->pctl_desc.owner = THIS_MODULE;
   674		pctl->pctl_desc.link_consumers = true;
   675	
   676		ret = devm_pinctrl_register_and_init(pctl->dev, &pctl->pctl_desc,
   677						     pctl, &pctl->pctl_dev);
   678		if (ret) {
   679			dev_err(pctl->dev, "pinctrl registration failed\n");
   680			return ret;
   681		}
   682	
   683		ret = pinctrl_enable(pctl->pctl_dev);
   684		if (ret) {
   685			dev_err(pctl->dev, "pinctrl enable failed\n");
   686			return ret;
   687		}
   688	
   689		/* Register gpio controller */
   690		pctl->gpio_chip.label = "stmfx-gpio";
   691		pctl->gpio_chip.parent = pctl->dev;
   692		pctl->gpio_chip.get_direction = stmfx_gpio_get_direction;
   693		pctl->gpio_chip.direction_input = stmfx_gpio_direction_input;
   694		pctl->gpio_chip.direction_output = stmfx_gpio_direction_output;
   695		pctl->gpio_chip.get = stmfx_gpio_get;
   696		pctl->gpio_chip.set = stmfx_gpio_set;
   697		pctl->gpio_chip.set_config = gpiochip_generic_config;
   698		pctl->gpio_chip.base = -1;
   699		pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
   700		pctl->gpio_chip.can_sleep = true;
   701	
   702		girq = &pctl->gpio_chip.irq;
   703		gpio_irq_chip_set_chip(girq, &stmfx_pinctrl_irq_chip);
   704		/* This will let us handle the parent IRQ in the driver */
   705		girq->parent_handler = NULL;
   706		girq->num_parents = 0;
   707		girq->parents = NULL;
   708		girq->default_type = IRQ_TYPE_NONE;
   709		girq->handler = handle_bad_irq;
   710		girq->threaded = true;
   711	
   712		ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
   713		if (ret) {
 > 714			dev_err(pctldev->dev, "gpio_chip registration failed\n");
   715			return ret;
   716		}
   717	
   718		ret = stmfx_pinctrl_gpio_function_enable(pctl);
   719		if (ret)
   720			return ret;
   721	
   722		ret = devm_request_threaded_irq(pctl->dev, irq, NULL,
   723						stmfx_pinctrl_irq_thread_fn,
   724						IRQF_ONESHOT,
   725						dev_name(pctl->dev), pctl);
   726		if (ret) {
   727			dev_err(pctldev->dev, "cannot request irq%d\n", irq);
   728			return ret;
   729		}
   730	
   731		dev_info(pctldev->dev,
   732			 "%ld GPIOs available\n", hweight_long(pctl->gpio_valid_mask));
   733	
   734		return 0;
   735	}
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


-=-=-=-=-=-=-=-=-=-=-=-
Groups.io Links: You receive all messages sent to this group.
View/Reply Online (#291): https://groups.io/g/linux-oxnas/message/291
Mute This Topic: https://groups.io/mt/98787606/1808289
Group Owner: linux-oxnas+owner@groups.io
Unsubscribe: https://groups.io/g/linux-oxnas/unsub [lists+linux-oxnas@lfdr.de]
-=-=-=-=-=-=-=-=-=-=-=-


