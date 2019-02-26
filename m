Return-Path: <SRS0=oKuo=RB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0470C43381
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 12:12:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D68D217F9
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Feb 2019 12:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oATt6H35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D68D217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNOmaI7rhMqqYLJx19z3ZiiB8R2I0crDdCRVXIyhqg8=; b=oATt6H35SPd1hW
	PrcblJd5c/2Tt4ePwtrahlbd1Cfn7ItOkDDcznv3FbGMgJo5syE2BNA2tecDtcoWWqw+h63svErV5
	qkehVAL4QL5wZi5Bpe1Q1dKvCSDpishq/jcziO4KH5fE9c8oUK4qaTY6Z9XqO3HmsTSe2eNoCZuwB
	PChASCCIfzf2vB8NqBaFYGGQ28CG/b6GqDxztMcIJmMaZFX22+QP8DbO3lam6h5mRE711yN5fjPgd
	LA63v81hSk/16Nfgf9c6SosZ58N9SbcOnv+D2K3ol63r7uTwuX2kBvgX1K1+RQup7hiJEL5Yot/uo
	sqH1YnBr1hV0zB1Jbq2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gybae-0006ck-L8; Tue, 26 Feb 2019 12:12:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gybaP-0006Eq-IN
 for linux-i3c@lists.infradead.org; Tue, 26 Feb 2019 12:11:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7658727F059;
 Tue, 26 Feb 2019 12:11:46 +0000 (GMT)
Date: Tue, 26 Feb 2019 13:11:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 1/3] i3c: Drop support for I2C 10 bit addresing
Message-ID: <20190226131143.05ee3987@collabora.com>
In-Reply-To: <20190226110003.5909-2-pgaj@cadence.com>
References: <20190226110003.5909-1-pgaj@cadence.com>
 <20190226110003.5909-2-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_041150_015415_1B72C8C7 
X-CRM114-Status: GOOD (  16.17  )
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

On Tue, 26 Feb 2019 11:00:01 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch dropps support for I2C devices with 10 bit addressing. When I2C
> device with 10 bit address is defined in DT, I3C master registration fails.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  drivers/i3c/master.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2dc628d..6c7fa4b 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1962,6 +1962,13 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	if (ret)
>  		return ret;
>  
> +    /* The I3C Specification does not clearly say I2C devices with 10-bit
> +     * address are supported. These devices can't be passed properly through
> +     * DEFSLVS command.
> +     */
> +    if (boardinfo->base.flags & I2C_CLIENT_TEN)

Please add a dev_err() here so that the user knows why it failed.

The rest of the series looks good.

> +        return -ENOTSUPP;
> +
>  	/* LVR is encoded in reg[2]. */
>  	boardinfo->lvr = reg[2];
>  


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
