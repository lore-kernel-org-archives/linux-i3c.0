Return-Path: <SRS0=g9Ly=57=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BC0C2BA19
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 10:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D765F20768
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2020 10:07:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRGBBTx/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D765F20768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfkGfVyj/MsiIEgL+wRqGfjrljWIV7vcR3fbvjBO2AE=; b=uRGBBTx/IJ5E7z
	bHi+klngUdfv0QYHp5oSaWpufxifV0PZXYelXufQbzWPhgWv3fFoxm5lOdNwcibM9cM5XYpRDcV2y
	HU+VUU1pH8ijzMcrvpuk9nI3jZMdYsacr37dQ4TsbB8EsNzKPRHjuMtTCfx7/5FUe1zh3p4vv+XCq
	qgVp7SRYjmODb0Jy/iGluYOoUgEbqjfSVfeF/e+Rh2F3N661fby3WmkVgCh3td83gstFyMcbkzDJ6
	CwSjlJArQXWJCtgb06pUDd85u20tphR0TMW42GPiXgnKIaYQGQDHhdtxNa1+QI5jbpz+m8NNKMfKO
	4CJRmelqDpSwxG98cWxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOexC-00060J-Vn; Wed, 15 Apr 2020 10:07:34 +0000
Received: from hostingweb31-40.netsons.net ([89.40.174.40])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOex7-0005yH-Jr
 for linux-i3c@lists.infradead.org; Wed, 15 Apr 2020 10:07:31 +0000
Received: from [88.147.20.223] (port=52216 helo=[192.168.77.62])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <luca@lucaceresoli.net>)
 id 1jOex1-009EsP-0V; Wed, 15 Apr 2020 12:07:23 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RFC PATCH v2 5/6] i2c: of: mark a whole array of regs as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-6-wsa+renesas@sang-engineering.com>
Message-ID: <578266c3-1bfb-2d7a-6d95-d40b3d8cd3ab@lucaceresoli.net>
Date: Wed, 15 Apr 2020 12:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-6-wsa+renesas@sang-engineering.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_030729_816808_470F15FE 
X-CRM114-Status: GOOD (  20.10  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran@bingham.xyz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

 18/03/20 16:00, Wolfram Sang wrote:
> Back then, 'reg' properties in I2C DT bindings only contained one
> address and this address was assigned a device and, thus, blocked.
> Meanwhile, chips using multiple addresses are common and the 'reg'
> property can be an array described by 'reg-names'. This code enhances
> I2C DT parsing, so it will reserve all addresses described in an array.
> They will be bound to the 'dummy' driver as 'reserved' iff the first
> address can be assigned successfully. If that is not the case, the array
> is not further considered. If one later address of the array can not be
> assigned, it will be reported but we don't bail out. The driver has to
> decide if that address is critical or not.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-of.c | 70 +++++++++++++++++++++++++--------------
>  1 file changed, 46 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index f2d09ea0d336..67eb2cd305cf 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -16,25 +16,18 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_device.h>
>  #include <linux/sysfs.h>
>  
>  #include "i2c-core.h"
>  
> -int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
> +static void of_i2c_decode_board_info(struct device_node *node, u32 addr,
> +				     bool first_addr, struct i2c_board_info *info)
>  {
> -	u32 addr;
> -	int ret;
> -
>  	memset(info, 0, sizeof(*info));
>  
> -	ret = of_property_read_u32(node, "reg", &addr);
> -	if (ret) {
> -		pr_err("invalid reg on %pOF\n", node);
> -		return ret;
> -	}
> -
> -	if (of_modalias_node(node, info->type, sizeof(info->type)) < 0)
> +	if (!first_addr || of_modalias_node(node, info->type, sizeof(info->type)) < 0)
>  		strlcpy(info->type, I2C_RESERVED_DRV_NAME, sizeof(I2C_RESERVED_DRV_NAME));
>  
>  	if (addr & I2C_TEN_BIT_ADDRESS) {
> @@ -51,11 +44,27 @@ int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
>  	info->of_node = node;
>  	info->fwnode = of_fwnode_handle(node);
>  
> -	if (of_property_read_bool(node, "host-notify"))
> -		info->flags |= I2C_CLIENT_HOST_NOTIFY;
> +	if (first_addr) {
> +		if (of_property_read_bool(node, "host-notify"))
> +			info->flags |= I2C_CLIENT_HOST_NOTIFY;
> +
> +		if (of_get_property(node, "wakeup-source", NULL))
> +			info->flags |= I2C_CLIENT_WAKE;
> +	}
> +}
> +
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
> +{
> +	u32 addr;
> +	int ret;
> +
> +	ret = of_property_read_u32(node, "reg", &addr);
> +	if (ret) {
> +		pr_err("invalid reg on %pOF\n", node);
> +		return ret;
> +	}
>  
> -	if (of_get_property(node, "wakeup-source", NULL))
> -		info->flags |= I2C_CLIENT_WAKE;
> +	of_i2c_decode_board_info(node, addr, true, info);
>  
>  	return 0;
>  }
> @@ -64,21 +73,34 @@ EXPORT_SYMBOL_GPL(of_i2c_get_board_info);
>  static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>  						 struct device_node *node)
>  {
> -	struct i2c_client *client;
> +	struct i2c_client *client, *first_client = ERR_PTR(-ENOENT);
>  	struct i2c_board_info info;
> -	int ret;
> +	bool first_reg = true;
> +	unsigned int i = 0;
> +	const __be32 *prop;
> +	u16 reg;
>  
>  	pr_debug("register %pOF\n", node);
>  
> -	ret = of_i2c_get_board_info(node, &info);
> -	if (ret)
> -		return ERR_PTR(ret);
> +	while ((prop = of_get_address(node, i++, NULL, NULL))) {
> +		reg = of_read_number(prop, 1);
> +		of_i2c_decode_board_info(node, reg, first_reg, &info);
> +
> +		client = i2c_new_client_device(adap, &info);
> +		if (IS_ERR(client)) {
> +			pr_err("failure registering addr 0x%02x for %pOF (%ld)\n",
> +				reg, node, PTR_ERR(client));
> +			if (first_reg)
> +				return client;
> +		}

I had an opportunity to runtime test this whole series on top of my TI
DS90UB95x serdes patches and it generally works fine.

I noticed however a minor annoyance in the above while loop. During
probing, these errors are produced:

  i2c i2c-0: Failed to register i2c client reserved at 0x40 (-16)
  i2c_of: failure registering addr 0x40 for /ocp/i2c@48070000/des_0@30 (-16)

This is logged as an error, so I assumed probing had failed, instead it
succeeded. This happens because the first loop iteration (on the first
'reg') triggers the driver's probe(), which in my case calls
i2c_new_ancillary_device() to register address 0x40. The second loop
iteration finds 0x40 in DT and tries to register it as "reserved", but
it fails. By design the loop continues successfully, but the (double)
error printed is misleading.

Fixing the second error, which comes from the above loop, is easy:

 client = i2c_new_client_device(adap, &info);
 if (IS_ERR(client)) {
-	pr_err("failure registering addr 0x%02x for %pOF (%ld)\n",
-		reg, node, PTR_ERR(client));
 	if (first_reg)
+		pr_err("failure registering addr 0x%02x for %pOF (%ld)\n",
+			reg, node, PTR_ERR(client));
 		return client;
 }

The other error is produced in i2c_new_client_device() and I see no
obvious way to put an if in front of the dev_err() except checking if
client->name equals I2C_RESERVED_DRV_NAME.

-- 
Luca

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
