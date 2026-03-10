Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D8DEA8550
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PB7uadmENt8xomU+3Y0dbt9MBPHYatD8HleRNc1KxPQ=; b=AsEFZBH2oGibb6
	1mUOk9JtsFiSQI/5A+4V/QWGkVWMlpnFSmFMvNz79F/m3ssYcssK58Q1Dt6AbbIbWBwOVHAg+R85q
	AWWa7r4cOMUV9v3WW/lyFNkV9NsS8odwVE7Kcn07Nx2SNLCU/xCx+iwcsPj3saSlYBp220bIE2TtH
	e3qE81Xz9yKCFTJwc4CA5aYd2YFsAmfqfdgjoc1vooKDAzN5B1aXp+bGW3iQFDFtySuDHiCSlIB9X
	JRCBqC7Q4dc4HF20FaeSPszfccBestmrPnZUfHnI7Wbv1Q+0mr2Ds3wnsz97M1ZrNeqpdIdF2ymFe
	g+9NhFgMTK3+mcA9JyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt8A-000000092zy-0jo3;
	Tue, 10 Mar 2026 09:11:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt87-000000092yM-3kKB
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 09:11:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso11276165e9.0
        for <linux-i3c@lists.infradead.org>; Tue, 10 Mar 2026 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773133914; x=1773738714; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BVRqxnHF4XZhg6MFagvA5pNw8KHuNYwkCYalVlxac8=;
        b=c3RzBXsFHgjbHCd2W9ywkoWE2o4fRo7qxcNB6brTeqaGjOaQ60Rrkha2516ZOmlR4K
         L3umXAd9Lo8FVBS77feU8V8iC1TEH4b2D0gG9PDvewRNxeqqqsAPLqCNiOv5HTAcOpTg
         4H4Tr5jqWSrZP1yQqzSAS8w+3XiOgaIah33D+xNd9r6xTpRYgV+RboIJ23QzFvOHf+dJ
         pWZjJLnmhfgCs7PGh3FPMpc1qVjJC00SJs1lcwK3Ov4Ibp8twqYN+FoCWOWGvt8f88le
         sgMcbIMJ4UHZa7z4qezCY9wDPGdbXrVxpi0dulHN6CPF8n/a3nDgPcL2xflmBotgmzdk
         kP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133914; x=1773738714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BVRqxnHF4XZhg6MFagvA5pNw8KHuNYwkCYalVlxac8=;
        b=ntavHMYbrzVme34AispsQXIUhETRn4B4M9X4Frb9vq9cR4wn6DVGptZoyj3hXlXuBN
         TCbq+QiTiHYK2fvM8be0BaWkJxZBrpvXAa8AYbAkZ3iVnInpxxV0p2YHKIo4P5DtefIn
         fKYLFRLT5KTLRNNlldDeQ/a7CorFTJhn9BW47metxrT3EnlKWs+1rhl2JHmcRonYsZNJ
         5I9FQO5d5HUPg0ToH3k5r02bJcWdGM1stSopyJnE+Xsl273XseLvLt0X6/mGZzilicyp
         niS3enEc9RS/ULKiD1jKms00sQCR+5DvmBPLe5EcnhZXW2Ak2pv4KQlUj6BoprKI0Zo3
         rIAw==
X-Forwarded-Encrypted: i=1; AJvYcCUhquTwxB0rA6/5BMbVmAm5uV4080JCulLvqWVxyEkRzDTwvAQ7yBFgWWnmdLy/pb6+GysWySXJLjY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxF2jVmsSB2yPruOJmrPGN/jQKR0Hm/OWyqQ61apbmBThFfLXX8
	GcHpFUj0qxQUiBe5XkjnBo/MiCv2jmhMyf2aH7oGXKWCd/qAbX30Y/gq
X-Gm-Gg: ATEYQzzeYF1LElQPpKzq81a3nJpVYLJYc8t5IIKe0BkjzvrmsGgYpID7qbjF7Xi4RsE
	Ld6DIRrJvH3HWvJrUQ6YHD3AEweKXDQzqHyyMNmoAv81vcSjeYSVNguTNkP5Pirshf7VO9Xqt0u
	lRilkqqc6tFAnTF6FyD9WcUQH0FSZjL0Mp1W3F+5QEUMFpBDdCg0Xi8HE78N1M+DABJFih44N4w
	STkK5LKCq/fmgyj/PO6tSuGq/NhAiRVAke7TdyWG+mjnPITysLXYGFZxGvCj0pRj1DV9t/7eUWA
	+RybI++b1a6Uq7zUVzYjzJaRR2h9EAgzHAGqHnLNqVtwbZvKB/JvyKsXdpYw1UT7UtuEKM9ZTg4
	ST/0O8ZUIa61DD/gzXJbojJSiNagqK5ZcrK4GLKegETubyrh16KKKHmqM9/hJWBBWmbfXO4O8l8
	gfZqZCP8eYR1baFLE8bOcsjMIwj/gTcACtRrNBCYoVCeNFSh9vFn4c8e4ofrn50xGpHOJJmKy7R
	3lZGMy5xwWstDx4Ol0iZAPBIB2ll2icpSHyX86a1MDLZxox+HUgMOYBloizG8xlRQ==
X-Received: by 2002:a05:600c:8b86:b0:485:3473:d4a1 with SMTP id 5b1f17b1804b1-4853473d6dcmr138617465e9.34.1773133913789;
        Tue, 10 Mar 2026 02:11:53 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a797dbasm73208645e9.7.2026.03.10.02.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:11:53 -0700 (PDT)
Date: Tue, 10 Mar 2026 10:11:50 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org, Frank.Li@nxp.com, 
	lgirdwood@gmail.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <7s2yvczgpyjmgdhyymoxcbumahnh24wwcluhmevkirtbh54x7l@4ckzuzlxrzkj>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-6-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-6-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_021156_100418_E6F1978F 
X-CRM114-Status: GOOD (  30.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 12:27:26PM +0530, Lakshay Piplani wrote:
> Add virtual I3C bus support for the hub and provide interface to enable
> or disable downstream ports.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> 
> ---
> Changes in v6:
>  - Add support for the generic I3C interface in the I3C Hub
> ---
> ---
>  MAINTAINERS             |   3 +
>  drivers/i3c/Kconfig     |  15 ++
>  drivers/i3c/Makefile    |   1 +
>  drivers/i3c/hub.c       | 459 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/hub.h | 107 ++++++++++
>  5 files changed, 585 insertions(+)
>  create mode 100644 drivers/i3c/hub.c
>  create mode 100644 include/linux/i3c/hub.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fc44b489ea1..7613b4b59290 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19110,12 +19110,15 @@ F:	drivers/ptp/ptp_netc.c
>  NXP P3H2X4X I3C-HUB DRIVER
>  M:	Vikash Bansal <vikash.bansal@nxp.com>
>  M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +M:	Lakshay Piplani <lakshay.piplani@nxp.com>
>  L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c-owner@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/i3c/hub.c
>  F:	drivers/mfd/p3h2840.c
>  F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
> +F:	include/linux/i3c/hub.h
>  F:	include/linux/mfd/p3h2840.h
>  
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index 30a441506f61..889d781f099b 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -21,4 +21,19 @@ menuconfig I3C
>  
>  if I3C
>  source "drivers/i3c/master/Kconfig"
> +
> +config I3C_HUB
> +	bool "I3C Hub Support"
> +	depends on I3C
> +	help
> +	  Enable support for the I3C interface in hub devices.
> +
> +	  This option adds virtual I3C bus support for hubs by creating
> +	  virtual master controllers for downstream ports and forwarding
> +	  bus operations through the hub device. It also provides an
> +	  interface used by hub drivers to enable or disable downstream
> +	  ports during bus transactions.
> +
> +	  Say Y here if your platform includes an I3C hub device
> +
>  endif # I3C

Hi Aman, the i3c subsytem allows to be compiled as module, why your
driver doesn't (due to bool instead of tristate), this causes, when
I3C is a module:

  arm-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_request_ibi':
  hub.c:(.text+0xec): undefined reference to `i3c_master_direct_attach_i3c_dev'
  ...

Can you force i3c built-in if hub is selected, or allow as a module?

Thanks,
Jorge
> diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> index 11982efbc6d9..9ddee56a6338 100644
> --- a/drivers/i3c/Makefile
> +++ b/drivers/i3c/Makefile
> @@ -2,3 +2,4 @@
>  i3c-y				:= device.o master.o
>  obj-$(CONFIG_I3C)		+= i3c.o
>  obj-$(CONFIG_I3C)		+= master/
> +obj-$(CONFIG_I3C_HUB)		+= hub.o
> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> index 000000000000..9cdea8635327
> --- /dev/null
> +++ b/drivers/i3c/hub.c
> @@ -0,0 +1,459 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026 NXP
> + * Generic I3C Hub core implementing virtual controller operations.
> + */
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/hub.h>
> +
> +#include "internals.h"
> +
> +/**
> + * i3c_hub_master_bus_init() - Bind controller to hub device
> + * @controller: Virtual controller for a hub port
> + *
> + * Associates the virtual controller with the hub device descriptor so that
> + * transfers are executed through the hub on the parent bus.
> + */
> +static int i3c_hub_master_bus_init(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->hub_dev)
> +		return -ENODEV;
> +
> +	controller->this = hub->hub_dev->desc;
> +	return 0;
> +}
> +
> +static void i3c_hub_master_bus_cleanup(struct i3c_master_controller *controller)
> +{
> +	controller->this = NULL;
> +}
> +
> +static int i3c_hub_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	return 0;
> +}
> +
> +static int i3c_hub_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 old_dyn_addr)
> +{
> +	return 0;
> +}
> +
> +static void i3c_hub_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +}
> +
> +/**
> + * i3c_hub_do_daa() - Perform DAA via hub port
> + * @hub: Hub instance
> + * @controller: Virtual controller for a hub port
> + *
> + * Enables the port connection, performs DAA on the parent controller,
> + * then disables the connection.
> + */
> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
> +	int ret;
> +
> +	if (!hub || !hub->parent)
> +		return -ENODEV;
> +
> +	i3c_hub_enable_port(controller);
> +	ret = i3c_master_do_daa(hub->parent);
> +	i3c_hub_disable_port(controller);
> +
> +	return ret;
> +}
> +
> +static bool i3c_hub_supports_ccc_cmd(struct i3c_hub *hub,
> +				     const struct i3c_ccc_cmd *cmd)
> +{
> +	return i3c_master_supports_ccc_cmd(hub->parent, cmd);
> +}
> +
> +/**
> + * i3c_hub_send_ccc_cmd() - Send CCC through hub port
> + * @hub: Hub instance
> + * @controller: Virtual controller
> + * @cmd: CCC command
> + *
> + * Enables the port connection while issuing CCC on the parent controller.
> + */
> +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> +				struct i3c_master_controller *controller,
> +				struct i3c_ccc_cmd *cmd)
> +{
> +	int ret;
> +
> +	if (!hub || !hub->parent)
> +		return -ENODEV;
> +
> +	i3c_hub_enable_port(controller);
> +	ret = i3c_master_send_ccc_cmd(hub->parent, cmd);
> +	i3c_hub_disable_port(controller);
> +
> +	return ret;
> +}
> +
> +/**
> + * i3c_hub_master_priv_xfers() - Execute private transfers via hub
> + * @dev: Target device descriptor
> + * @xfers: Transfer array
> + * @nxfers: Number of transfers
> + *
> + * Handles address adjustment and forwards private transfers through the hub
> + * device.
> + */
> +static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_xfer *xfers,
> +				     int nxfers,
> +				     enum i3c_xfer_mode mode)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(dev);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_dev_desc *hub_dev;
> +	u8 hub_addr, target_addr;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->hub_dev)
> +		return -ENODEV;
> +
> +	hub_dev = hub->hub_dev->desc;
> +
> +	i3c_hub_enable_port(controller);
> +
> +	hub_addr = hub_dev->info.dyn_addr ?
> +		   hub_dev->info.dyn_addr : hub_dev->info.static_addr;
> +
> +	target_addr = dev->info.dyn_addr ?
> +		      dev->info.dyn_addr : dev->info.static_addr;
> +
> +	if (hub_addr != target_addr) {
> +		hub_dev->info.dyn_addr = target_addr;
> +		ret = i3c_master_reattach_i3c_dev(hub_dev, target_addr);
> +		if (ret)
> +			goto disable;
> +	}
> +
> +	ret = i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);
> +
> +	if (hub_addr != target_addr) {
> +		hub_dev->info.dyn_addr = hub_addr;
> +		ret |= i3c_master_reattach_i3c_dev(hub_dev, hub_addr);
> +	}
> +
> +disable:
> +	i3c_hub_disable_port(controller);
> +	return ret;
> +}
> +
> +static int i3c_hub_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	return 0;
> +}
> +
> +static void i3c_hub_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +}
> +
> +static int i3c_hub_i2c_xfers(struct i2c_dev_desc *dev,
> +			     struct i2c_msg *xfers, int nxfers)
> +{
> +	return 0;
> +}
> +
> +static int i3c_hub_master_do_daa(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	return i3c_hub_do_daa(hub, controller);
> +}
> +
> +static int i3c_hub_master_send_ccc_cmd(struct i3c_master_controller *controller,
> +				       struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->parent)
> +		return -ENODEV;
> +
> +	if (cmd->id == I3C_CCC_RSTDAA(true))
> +		return 0;
> +
> +	return i3c_hub_send_ccc_cmd(hub, controller, cmd);
> +}
> +
> +static bool i3c_hub_master_supports_ccc_cmd(struct i3c_master_controller *controller,
> +					    const struct i3c_ccc_cmd *cmd)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	return i3c_hub_supports_ccc_cmd(hub, cmd);
> +}
> +
> +/**
> + * i3c_hub_request_ibi() - Request IBI through parent controller
> + * @desc: Target device descriptor
> + * @req: IBI setup
> + *
> + * Temporarily updates parent controller context to request IBI for a device
> + * connected through the hub.
> + */
> +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> +			       const struct i3c_ibi_setup *req)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *orig_parent;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->parent)
> +		return -ENODEV;
> +
> +	parent = hub->parent;
> +
> +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> +
> +	ret = i3c_master_direct_attach_i3c_dev(parent, desc);
> +	if (ret) {
> +		i3c_hub_restore_desc_parent(&desc->common, orig_parent);
> +		return ret;
> +	}
> +
> +	mutex_unlock(&desc->ibi_lock);
> +	kfree(desc->ibi);
> +	desc->ibi = NULL;
> +	ret = i3c_dev_request_ibi_locked(desc, req);
> +	mutex_lock(&desc->ibi_lock);
> +
> +	i3c_hub_restore_desc_parent(&desc->common, orig_parent);
> +
> +	return ret;
> +}
> +
> +static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *orig_parent;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return;
> +
> +	hub = hub_controller->hub;
> +
> +	parent = hub->parent;
> +
> +	i3c_hub_enable_port(controller);
> +
> +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> +	i3c_master_direct_detach_i3c_dev(desc);
> +	mutex_unlock(&desc->ibi_lock);
> +	i3c_dev_free_ibi_locked(desc);
> +	mutex_lock(&desc->ibi_lock);
> +	i3c_hub_restore_desc_parent(&desc->common, orig_parent);
> +
> +	i3c_hub_disable_port(controller);
> +}
> +
> +/**
> + * i3c_hub_enable_ibi() - Enable IBI via hub port
> + * @desc: Target device descriptor
> + *
> + * Enables port connection and forwards the IBI enable request to the parent
> + * controller.
> + */
> +static int i3c_hub_enable_ibi(struct i3c_dev_desc *desc)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *orig_parent;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->parent)
> +		return -ENODEV;
> +
> +	parent = hub->parent;
> +
> +	i3c_hub_enable_port(controller);
> +
> +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> +
> +	down_write(&parent->bus.lock);
> +	mutex_unlock(&desc->ibi_lock);
> +	ret = i3c_dev_enable_ibi_locked(desc);
> +	mutex_lock(&desc->ibi_lock);
> +	up_write(&parent->bus.lock);
> +
> +	i3c_hub_restore_desc_parent(&desc->common, orig_parent);
> +
> +	i3c_hub_disable_port(controller);
> +
> +	return ret;
> +}
> +
> +/**
> + * i3c_hub_disable_ibi() - Disable IBI via hub port
> + * @desc: Target device descriptor
> + *
> + * Enables port connection and forwards the IBI disable request to the parent
> + * controller.
> + */
> +static int i3c_hub_disable_ibi(struct i3c_dev_desc *desc)
> +{
> +	struct i3c_master_controller *controller = i3c_dev_get_master(desc);
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_master_controller *orig_parent;
> +	struct i3c_master_controller *parent;
> +	struct i3c_hub *hub;
> +	int ret;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return -ENODEV;
> +
> +	hub = hub_controller->hub;
> +
> +	if (!hub->parent)
> +		return -ENODEV;
> +
> +	parent = hub->parent;
> +
> +	i3c_hub_enable_port(controller);
> +
> +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> +
> +	down_write(&parent->bus.lock);
> +	mutex_unlock(&desc->ibi_lock);
> +	ret = i3c_dev_disable_ibi_locked(desc);
> +	mutex_lock(&desc->ibi_lock);
> +	up_write(&parent->bus.lock);
> +
> +	i3c_hub_restore_desc_parent(&desc->common, orig_parent);
> +
> +	i3c_hub_disable_port(controller);
> +
> +	return ret;
> +}
> +
> +static void i3c_hub_recycle_ibi_slot(struct i3c_dev_desc *desc,
> +				     struct i3c_ibi_slot *slot)
> +{
> +}
> +
> +static const struct i3c_master_controller_ops i3c_hub_master_ops_data = {
> +	.bus_init = i3c_hub_master_bus_init,
> +	.bus_cleanup = i3c_hub_master_bus_cleanup,
> +	.attach_i3c_dev = i3c_hub_attach_i3c_dev,
> +	.reattach_i3c_dev = i3c_hub_reattach_i3c_dev,
> +	.detach_i3c_dev = i3c_hub_detach_i3c_dev,
> +	.do_daa = i3c_hub_master_do_daa,
> +	.supports_ccc_cmd = i3c_hub_master_supports_ccc_cmd,
> +	.send_ccc_cmd = i3c_hub_master_send_ccc_cmd,
> +	.i3c_xfers = i3c_hub_master_priv_xfers,
> +	.attach_i2c_dev = i3c_hub_attach_i2c_dev,
> +	.detach_i2c_dev = i3c_hub_detach_i2c_dev,
> +	.i2c_xfers = i3c_hub_i2c_xfers,
> +	.request_ibi = i3c_hub_request_ibi,
> +	.free_ibi = i3c_hub_free_ibi,
> +	.enable_ibi = i3c_hub_enable_ibi,
> +	.disable_ibi = i3c_hub_disable_ibi,
> +	.recycle_ibi_slot = i3c_hub_recycle_ibi_slot,
> +};
> +
> +/**
> + * i3c_hub_init() - Initialize hub context
> + * @hub: Hub instance
> + * @parent: Parent I3C master controller
> + * @ops: Vendor callbacks
> + * @hub_dev: I3C hub device
> + */
> +struct i3c_hub *i3c_hub_init(struct i3c_master_controller *parent,
> +			     const struct i3c_hub_ops *ops,
> +			     struct i3c_device *hub_dev)
> +{
> +	struct i3c_hub *hub;
> +
> +	hub = devm_kzalloc(&hub_dev->dev,
> +			   sizeof(*hub),
> +			   GFP_KERNEL);
> +
> +	if (!hub)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hub->parent = parent;
> +	hub->ops = ops;
> +	hub->hub_dev = hub_dev;
> +
> +	return hub;
> +}
> +EXPORT_SYMBOL_GPL(i3c_hub_init);
> +
> +const struct i3c_master_controller_ops *i3c_hub_master_ops(void)
> +{
> +	return &i3c_hub_master_ops_data;
> +}
> +EXPORT_SYMBOL_GPL(i3c_hub_master_ops);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> +MODULE_DESCRIPTION("Generic I3C hub support");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/i3c/hub.h b/include/linux/i3c/hub.h
> new file mode 100644
> index 000000000000..b685d4d3cc7e
> --- /dev/null
> +++ b/include/linux/i3c/hub.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2026 NXP
> + * Generic hub definitions and helper interfaces.
> + */
> +#ifndef _LINUX_I3C_HUB_H
> +#define _LINUX_I3C_HUB_H
> +
> +#include <linux/i3c/master.h>
> +
> +static inline struct i3c_master_controller *
> +i3c_hub_update_desc_parent(struct i3c_i2c_dev_desc *desc,
> +			   struct i3c_master_controller *parent)
> +{
> +	struct i3c_master_controller *orig_parent = desc->master;
> +
> +	desc->master = parent;
> +	return orig_parent;
> +}
> +
> +static inline void
> +i3c_hub_restore_desc_parent(struct i3c_i2c_dev_desc *desc,
> +			    struct i3c_master_controller *parent)
> +{
> +	desc->master = parent;
> +}
> +
> +/**
> + * struct i3c_hub - Generic I3C hub context
> + * @parent: Parent I3C master controller
> + * @ops: Vendor callbacks for port connection control
> + * @hub_dev: I3C device representing the hub on the parent bus
> + */
> +struct i3c_hub {
> +	struct i3c_master_controller *parent;
> +	const struct i3c_hub_ops *ops;
> +	struct i3c_device *hub_dev;
> +};
> +
> +struct i3c_hub_controller {
> +	struct i3c_master_controller *parent;
> +	struct i3c_master_controller controller;
> +	struct i3c_hub *hub;
> +};
> +
> +struct i3c_hub_ops {
> +	void (*enable_port)(struct i3c_master_controller *controller);
> +	void (*disable_port)(struct i3c_master_controller *controller);
> +};
> +
> +/**
> + * i3c_hub_enable_port() - Enable hub connection for a controller
> + * @controller: Virtual controller representing a hub port
> + *
> + * Retrieves hub context from controller drvdata and invokes the vendor
> + * callback to enable the associated port connection.
> + */
> +static inline void i3c_hub_enable_port(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return;
> +
> +	hub = hub_controller->hub;
> +
> +	if (hub && hub->ops && hub->ops->enable_port)
> +		hub->ops->enable_port(controller);
> +}
> +
> +/**
> + * i3c_hub_disable_port() - Disable hub connection for a controller
> + * @controller: Virtual controller representing a hub port
> + *
> + * Retrieves hub context from controller drvdata and invokes the vendor
> + * callback to disable the associated port connection.
> + */
> +static inline void i3c_hub_disable_port(struct i3c_master_controller *controller)
> +{
> +	struct i3c_hub_controller *hub_controller;
> +	struct i3c_hub *hub;
> +
> +	hub_controller = dev_get_drvdata(&controller->dev);
> +	if (!hub_controller || !hub_controller->hub)
> +		return;
> +
> +	hub = hub_controller->hub;
> +
> +	if (hub && hub->ops && hub->ops->disable_port)
> +		hub->ops->disable_port(controller);
> +}
> +
> +/**
> + * i3c_hub_master_ops() - Return virtual controller ops for hub ports
> + *
> + * Provides i3c_master_controller_ops used by controllers created for hub
> + * ports.
> + */
> +const struct i3c_master_controller_ops *i3c_hub_master_ops(void);
> +
> +struct i3c_hub *i3c_hub_init(struct i3c_master_controller *parent,
> +			     const struct i3c_hub_ops *ops,
> +			     struct i3c_device *hub_dev);
> +
> +#endif
> -- 
> 2.25.1
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
