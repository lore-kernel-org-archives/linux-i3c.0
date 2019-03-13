Return-Path: <SRS0=ZMWT=RQ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDFFC43381
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Mar 2019 19:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A2120657
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Mar 2019 19:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OsHHXOqH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UVExDYap"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A2120657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22l2ITA7FOU6MD+k8GrJUHV/xUt5A1/Nq0nBxpI+y2k=; b=OsHHXOqHJgLk7y
	mEVc4EZQKJrp58FvNJmidBX4WTuSYagSpfhkQKX9YbgWOHAZLIVIPe5laWdnkbHGigRX1nWa0C2CH
	WuVnmXQgXf/Dka5XxnptH8jN0fgrh9My41f7OGRxWTTK9n9OVRMR7naRAfUEULvXkB4FebcMVtlTv
	H1HwEKU8DaGnBdtXS7dLIwokMi9EfXW0hgizso0KWWriFXEXlPWLPIxi85c5ioVg6NWY8Knp/yKl7
	YkgxDZP4/pLIieVXVStHcoUWfB2n0TeihlCZAYcrRgW8M0sibypoJH+ItHeAmqAws7CodQeaFoECU
	gTuvLuSgY0cgoP3ENfcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h49a5-0004tI-HA; Wed, 13 Mar 2019 19:30:25 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h49a2-0004sF-9A
 for linux-i3c@lists.infradead.org; Wed, 13 Mar 2019 19:30:23 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 6265410C1CAF;
 Wed, 13 Mar 2019 12:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1552505419; bh=4aDh2LG8w7BPoLEd8ompsJMb5rUa3fOUnF1QL7ZCy9A=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=UVExDYapo0AnkjleY87dmCcxvn2sKjceP5T2Gm3AsJzRdpnjiDhm2Lx/qlbiluUts
 i1xpAKoReCx7wkLLx37bDc/nyi9V1RnQq6HwABwTIesQmpgzk/14WZMR0XMW4exP6C
 iyR+rrYE3rmOSWDG14mu3B5fbxtEVaZrYmVhEU1KhWk1v7Bsscqc0U++F/LPyqhV9X
 5lhVbtPAAO3idzQolZGUNKW9GlVf0xvnI9siilvKba+YapkqRvb5HqmtH4/dg4cM1S
 bsiCFZdMLz1YEOP1K+WQbbcZBg3Cge3alugha8CNIaFhfOz7KwxAC+jC1CfV9UwZxM
 n8lIqSDcxh0gQ==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 01118A005D;
 Wed, 13 Mar 2019 19:30:18 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 13 Mar 2019 12:30:18 -0700
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 13 Mar 2019 20:30:16 +0100
Received: from [10.0.2.15] (10.107.25.100) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Wed, 13 Mar 2019 20:30:16 +0100
Subject: Re: [PATCH 1/4] i3c: Drop support for I2C 10 bit addresing
To: Przemyslaw Gaj <pgaj@cadence.com>, <bbrezillon@kernel.org>
References: <20190307095808.22540-1-pgaj@cadence.com>
 <20190307095808.22540-2-pgaj@cadence.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <82326a77-9cd5-16d7-3fc2-5ffce2c44aeb@synopsys.com>
Date: Wed, 13 Mar 2019 19:30:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307095808.22540-2-pgaj@cadence.com>
Content-Language: en-US
X-Originating-IP: [10.107.25.100]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_123022_325310_548D4B54 
X-CRM114-Status: GOOD (  21.30  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Przemek,


On 07/03/19 09:58, Przemyslaw Gaj wrote:
> This patch dropps support for I2C devices with 10 bit addressing. When I2C
> device with 10 bit address is defined in DT, I3C master registration fails.
>
> Address space for I2C devices has been reduced and ->i2c_funcs() hook has been
> removed.
>
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  drivers/i3c/master.c       | 19 +++++++++++--------
>  include/linux/i3c/master.h |  5 +----
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2dc628d..5b3adb3 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1962,6 +1962,16 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * The I3C Specification does not clearly say I2C devices with 10-bit
> +	 * address are supported. These devices can't be passed properly through
> +	 * DEFSLVS command.
> +	 */
> +	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
> +		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
> +		return -ENOTSUPP;
> +	}
> +
>  	/* LVR is encoded in reg[2]. */
>  	boardinfo->lvr = reg[2];
>  
> @@ -2111,16 +2121,9 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
>  	return ret ? ret : nxfers;
>  }
>  
> -static u32 i3c_master_i2c_functionalities(struct i2c_adapter *adap)
> -{
> -	struct i3c_master_controller *master = i2c_adapter_to_i3c_master(adap);
> -
> -	return master->ops->i2c_funcs(master);
> -}
> -
>  static const struct i2c_algorithm i3c_master_i2c_algo = {
>  	.master_xfer = i3c_master_i2c_adapter_xfer,
> -	.functionality = i3c_master_i2c_functionalities,
> +	.functionality = I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C,
>  };
>  
>  static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index f13fd8b..eca8337 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -48,7 +48,7 @@ struct i3c_i2c_dev_desc {
>  #define I3C_LVR_I2C_INDEX(x)		((x) << 5)
>  #define I3C_LVR_I2C_FM_MODE		BIT(4)
>  
> -#define I2C_MAX_ADDR			GENMASK(9, 0)
> +#define I2C_MAX_ADDR			GENMASK(6, 0)
>  
>  /**
>   * struct i2c_dev_boardinfo - I2C device board information
> @@ -390,8 +390,6 @@ struct i3c_bus {
>   *	       and i2c_put_dma_safe_msg_buf() helpers provided by the I2C
>   *	       framework.
>   *	       This method is mandatory.
> - * @i2c_funcs: expose the supported I2C functionalities.
> - *	       This method is mandatory.
>   * @request_ibi: attach an IBI handler to an I3C device. This implies defining
>   *		 an IBI handler and the constraints of the IBI (maximum payload
>   *		 length and number of pre-allocated slots).
> @@ -437,7 +435,6 @@ struct i3c_master_controller_ops {
>  	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>  	int (*i2c_xfers)(struct i2c_dev_desc *dev,
>  			 const struct i2c_msg *xfers, int nxfers);
> -	u32 (*i2c_funcs)(struct i3c_master_controller *master);
>  	int (*request_ibi)(struct i3c_dev_desc *dev,
>  			   const struct i3c_ibi_setup *req);
>  	void (*free_ibi)(struct i3c_dev_desc *dev);

Still need to remove ops->i2c_funcs from i3c_master_check_ops.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
