Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11997C761A6
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 19:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=em8JGtgqmxAegyHrS+jmd82m8NnjnBAMP+krIbzB6is=; b=F4ZDRevcwIu/Ck
	qua4IRACDZSRP2fKLXiw4qNtL+pcmJE1pGIDQ54/8J8t+IV5D5bpu+Ogzuer28Q91WV812piZQD6/
	4qEZbSlqFbZbdB6XWPq6EBaPd58OxwYlQxgm95DOfl0PQueC/aRFYaftca/m4DOp2n/kODK0xwVRZ
	2urFEyDgTpUWnEseP8s3aMq6AMXowp2O91fBiWxKvh1MJS1dVXp/PgS+GCfxGV5DimhMDpJygMCCc
	g/rr69ses+Kem+4ZoDLgl3Imqi7zzaPcPWi1NlX3qQiGFZ0dMJpBtQH7Pf42Rhrz8jxx8wxR41KRI
	aknJZgFt0GxFWXEUgh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phxqs-004ug4-24;
	Thu, 30 Mar 2023 19:22:26 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phxqp-004ue4-0L
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 19:22:24 +0000
Received: by mail-wr1-x435.google.com with SMTP id q19so17091649wrc.5
        for <linux-i3c@lists.infradead.org>; Thu, 30 Mar 2023 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1680204138;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iOtqUCdyuRdmWXFTJkLWL+FkLBoZ7wafAdfw6LOqlQ=;
        b=F3QFFbqCXDEnIpyJhs4MDF4ne+usee+Ktc6F4EnhlNI7Aldf4To+VyZFrdAJ6doqIB
         rnSTmc/uVPYbhHY0iNQ0507VQt1r4qPFe/es8b6e+Yv4ubih3TF2uCH32uVIFXEbxM8V
         OYtZU9cQo6teN+XFr9faeZkI9URKvgelxa4Ask9oC5+K8iqbcKS0AkSNuIZgvEMfLVN7
         CO+fUJmpvmfK+j/TgO/bd3gmySQX/QYv/1QdKLWacSlLj4gNk+KrX+XCQ/V9LM5Biz7M
         0C1KZQ3NoGE00OOlcWb/7V9oJbGiH0tRcdMsO2r72sruR6WysFuvuG3Vr5KiYcqVNs3B
         5vNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680204138;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iOtqUCdyuRdmWXFTJkLWL+FkLBoZ7wafAdfw6LOqlQ=;
        b=WzQ1bUB0Ml+kGFyyvVqxoyJy2Yze0/URq4kmZ32LDJiSkrKCYuLF3Oi3jBxMeHHaF6
         Me/tHjW8SeK9i9OM/WhZVYtDtuxPQrP983czSyi2A8z869pJYRQQxJ6QAyOX0Kb6kCKf
         nP5ZQX5fV2lAsTVjHv3Q4kdeqVM5wbar7tpzxmYQFzlKw/AEEiiYRzgaaswszsldQH1G
         xcX+j0d4cGnZMm1IQn+FgxhGus7frkoK1EVf3M+CRJGnObOHcAlsP42iU7/jWe3x6GXa
         zqcAAyMobFAY2jwtHCUq6o5jNUtn4DxTVLo3+u9h3OgsYLNS12bUWZFA8D6w4Kg27lLP
         DJzw==
X-Gm-Message-State: AAQBX9euCdiXIUerRhfGD7waT70QQZibzEvCAeNkG03BVeinHG+Y22UK
	jkCRi2wcDgw+oDAyVwpxB/Kt+g==
X-Google-Smtp-Source: AKy350bHr4WqRdFCrPaChz1730ERz9EOpFBGJfm9+WdjIt6b637uSWSOliu1JT6XlHmNzaDn+gZetw==
X-Received: by 2002:adf:fc4b:0:b0:2cf:6088:6102 with SMTP id e11-20020adffc4b000000b002cf60886102mr20581210wrs.41.1680204138498;
        Thu, 30 Mar 2023 12:22:18 -0700 (PDT)
Received: from [192.168.0.16] (cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net. [86.15.83.122])
        by smtp.gmail.com with ESMTPSA id f9-20020adfe909000000b002c7163660a9sm125373wrm.105.2023.03.30.12.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 12:22:18 -0700 (PDT)
Message-ID: <b6d88196-aafc-4880-9de3-7725e253cfa7@sifive.com>
Date: Thu, 30 Mar 2023 20:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] i3c: ast2600: Add AST2600 platform-specific driver
Content-Language: en-GB
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>,
 Vitor Soares <ivitro@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jack Chen <zenghuchen@google.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <cover.1680160851.git.jk@codeconstruct.com.au>
 <d4424535a88f529ca8efa67246ee25a5d810c6c1.1680160851.git.jk@codeconstruct.com.au>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <d4424535a88f529ca8efa67246ee25a5d810c6c1.1680160851.git.jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_122223_167748_9425F824 
X-CRM114-Status: GOOD (  34.93  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 30/03/2023 08:22, Jeremy Kerr wrote:
> Now that we have platform-specific infrastructure for the dw i3c driver,
> add platform support for the ASPEED AST2600 SoC.
> 
> The AST2600 has a small set of "i3c global" registers, providing
> platform-level i3c configuration outside of the i3c core.
> 
> For the ast2600, we need a couple of extra setup operations:
> 
>   - on probe: find the i3c global register set and parse the SDA pullup
>     resistor values
> 
>   - on init: set the pullups accordingly, and set the i3c instance IDs
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> ---
> v2:
>   - use new dw platform infrastructure
> ---
>   MAINTAINERS                             |   6 +
>   drivers/i3c/master/Kconfig              |  14 ++
>   drivers/i3c/master/Makefile             |   1 +
>   drivers/i3c/master/ast2600-i3c-master.c | 169 ++++++++++++++++++++++++
>   4 files changed, 190 insertions(+)
>   create mode 100644 drivers/i3c/master/ast2600-i3c-master.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd8ebc25afcf..ecadd5ccf771 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9714,6 +9714,12 @@ S:	Orphan
>   F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
>   F:	drivers/i3c/master/dw*
>   
> +I3C DRIVER FOR ASPEED AST2600
> +M:	Jeremy Kerr <jk@codeconstruct.com.au>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
> +F:	drivers/i3c/master/ast2600-i3c-master.c
> +
>   I3C SUBSYSTEM
>   M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
>   L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 3b8f95916f46..90dee3ec5520 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -22,6 +22,20 @@ config DW_I3C_MASTER
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called dw-i3c-master.
>   
> +config AST2600_I3C_MASTER
> +	tristate "ASPEED AST2600 I3C master driver"
> +	depends on DW_I3C_MASTER
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	select MFD_SYSCON
> +	help
> +	  Support for ASPEED AST2600 I3C Controller.
> +
> +	  This hardware is an instance of the DW I3C controller; this
> +	  driver adds platform- specific support for AST2600 hardware.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called ast2600-i3c-master.
> +
>   config SVC_I3C_MASTER
>   	tristate "Silvaco I3C Dual-Role Master driver"
>   	depends on I3C
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index b3fee0f690b2..3e97960160bc 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
>   obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
> +obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>   obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
>   obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
> new file mode 100644
> index 000000000000..d3d7b7d19f22
> --- /dev/null
> +++ b/drivers/i3c/master/ast2600-i3c-master.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Code Construct
> + *
> + * Author: Jeremy Kerr <jk@codeconstruct.com.au>
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "dw-i3c-master.h"
> +
> +/* AST2600-specific global register set */
> +#define AST2600_I3CG_REG0(idx)	(((idx) * 4 * 4) + 0x10)
> +#define AST2600_I3CG_REG1(idx)	(((idx) * 4 * 4) + 0x14)
> +
> +#define AST2600_I3CG_REG0_SDA_PULLUP_EN_MASK	GENMASK(29, 28)
> +#define AST2600_I3CG_REG0_SDA_PULLUP_EN_2K	(0x0 << 28)
> +#define AST2600_I3CG_REG0_SDA_PULLUP_EN_750	(0x2 << 28)
> +
> +#define AST2600_I3CG_REG1_I2C_MODE		BIT(0)
> +#define AST2600_I3CG_REG1_TEST_MODE		BIT(1)
> +#define AST2600_I3CG_REG1_ACT_MODE_MASK		GENMASK(3, 2)
> +#define AST2600_I3CG_REG1_ACT_MODE(x)		(((x) << 2) & AST2600_I3CG_REG1_ACT_MODE_MASK)
> +#define AST2600_I3CG_REG1_PENDING_INT_MASK	GENMASK(7, 4)
> +#define AST2600_I3CG_REG1_PENDING_INT(x)	(((x) << 4) & AST2600_I3CG_REG1_PENDING_INT_MASK)
> +#define AST2600_I3CG_REG1_SA_MASK		GENMASK(14, 8)
> +#define AST2600_I3CG_REG1_SA(x)			(((x) << 8) & AST2600_I3CG_REG1_SA_MASK)
> +#define AST2600_I3CG_REG1_SA_EN			BIT(15)
> +#define AST2600_I3CG_REG1_INST_ID_MASK		GENMASK(19, 16)
> +#define AST2600_I3CG_REG1_INST_ID(x)		(((x) << 16) & AST2600_I3CG_REG1_INST_ID_MASK)
> +
> +#define AST2600_DEFAULT_SDA_PULLUP_OHMS		2000
> +
> +struct ast2600_i3c_platform_data {
> +	struct regmap *global_regs;
> +	unsigned int global_idx;
> +	unsigned int sda_pullup;
> +};
> +
> +static int ast2600_i3c_pullup_to_reg(unsigned int ohms, u32 *regp)
> +{
> +	u32 reg;
> +
> +	switch (ohms) {
> +	case 2000:
> +		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K;
> +		break;
> +	case 750:
> +		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
> +		break;
> +	case 545:
> +		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K |
> +			AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (regp)
> +		*regp = reg;
> +
> +	return 0;
> +}
> +
> +static int ast2600_i3c_init(struct dw_i3c_master *master)
> +{
> +	struct ast2600_i3c_platform_data *pdata = master->platform_data;
> +	u32 reg = 0;
> +	int rc;
> +
> +	/* reg0: set SDA pullup values */
> +	rc = ast2600_i3c_pullup_to_reg(pdata->sda_pullup, &reg);
> +	if (rc)
> +		return rc;
> +
> +	rc = regmap_write(pdata->global_regs,
> +			  AST2600_I3CG_REG0(pdata->global_idx), reg);
> +	if (rc)
> +		return rc;
> +
> +	/* reg1: set up the instance id, but leave everything else disabled,
> +	 * as it's all for client mode
> +	 */
> +	reg = AST2600_I3CG_REG1_INST_ID(pdata->global_idx);
> +	rc = regmap_write(pdata->global_regs,
> +			  AST2600_I3CG_REG1(pdata->global_idx), reg);
> +
> +	return rc;
> +}
> +
> +const struct dw_i3c_platform_ops ast2600_i3c_ops = {
> +	.init = ast2600_i3c_init,
> +};
> +
> +static int ast2600_i3c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct ast2600_i3c_platform_data *pdata;
> +	struct of_phandle_args gspec;
> +	struct dw_i3c_master *dw_i3c;
> +	int rc;
> +
> +	dw_i3c = devm_kzalloc(&pdev->dev, sizeof(*dw_i3c) + sizeof(*pdata),
> +			      GFP_KERNEL);
> +	if (!dw_i3c)
> +		return -ENOMEM;


How about wrapping the dw_i3c_master struct in an as2600_master struct
and then you can use container of, and simply do sizeof(struct 
ast2600_master) ?

Also removes the need below to set pdata at-all

> +	pdata = (void *)(dw_i3c + 1);
> +
> +	rc = of_parse_phandle_with_fixed_args(np, "aspeed,global-regs", 1, 0,
> +					      &gspec);
> +	if (rc)
> +		return -ENODEV;
> +
> +	pdata->global_regs = syscon_node_to_regmap(gspec.np);
> +	of_node_put(gspec.np);
> +
> +	if (IS_ERR(pdata->global_regs))
> +		return PTR_ERR(pdata->global_regs);
> +
> +	pdata->global_idx = gspec.args[0];
> +
> +	rc = of_property_read_u32(np, "sda-pullup-ohms", &pdata->sda_pullup);
> +	if (rc)
> +		pdata->sda_pullup = AST2600_DEFAULT_SDA_PULLUP_OHMS;
> +
> +	rc = ast2600_i3c_pullup_to_reg(pdata->sda_pullup, NULL);
> +	if (rc)
> +		dev_err(&dw_i3c->base.dev, "invalid sda-pullup value %d\n",
> +			pdata->sda_pullup);
> +
> +	dw_i3c->platform_ops = &ast2600_i3c_ops;
> +	dw_i3c->platform_data = pdata;
> +	rc = dw_i3c_common_probe(dw_i3c, pdev);
> +
> +	return rc;
> +}
> +
> +static int ast2600_i3c_remove(struct platform_device *pdev)
> +{
> +	struct dw_i3c_master *dw_i3c = platform_get_drvdata(pdev);
> +
> +	return dw_i3c_common_remove(dw_i3c);
> +}
> +
> +static const struct of_device_id ast2600_i3c_master_of_match[] = {
> +	{ .compatible = "aspeed,ast2600-i3c", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ast2600_i3c_master_of_match);
> +
> +static struct platform_driver ast2600_i3c_driver = {
> +	.probe = ast2600_i3c_probe,
> +	.remove = ast2600_i3c_remove,
> +	.driver = {
> +		.name = "ast2600-i3c-master",
> +		.of_match_table = of_match_ptr(ast2600_i3c_master_of_match),

given this is probably an of-device only, of_match_ptr not needed here?

> +	},
> +};
> +module_platform_driver(ast2600_i3c_driver);
> +
> +MODULE_AUTHOR("Jeremy Kerr <jk@codeconstruct.com.au>");
> +MODULE_DESCRIPTION("ASPEED AST2600 I3C driver");
> +MODULE_LICENSE("GPL");


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
