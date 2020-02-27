Return-Path: <SRS0=/dce=4P=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98504C35677
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 14:41:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A0624656
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Feb 2020 14:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PsgLkZjm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A0624656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=us1ScOEH6QNOJwzDtLfwmXuSzjVYxMkIGKzoM2I4ww4=; b=PsgLkZjm7CUCZO
	S6Q1eyXve7lmUig7ZGr45g5EynNdZAPM2wU2W+ONU5qpTguJA1HRuM63VjtOqrYwqOQry4gJkNxM4
	OmBmc74rjPTy1I1Y70G4CWI/xJzNgHbMB8NQNMrZq7zQz2pmtBIMQ2P1llwT09EQARUJoCLbGvbxp
	H1gcTwa3Z1qhhdfBTAV0AmAbEagYTD2gENBKUXhm5ZC9XB271nvoSQZbSWo7DCVVf4dZK6QfddDWH
	oTWNmRiawmLTlU2rJVVVUgWeFuPX+lGdSlBAaN1aX+DCWwmRtH58MPd2HcWxfKJR80Dkv+dIksD+0
	gXMWT/Wl+l9mSRgFX/HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7KLw-0004v9-3g; Thu, 27 Feb 2020 14:41:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7KLt-0004uU-Aj
 for linux-i3c@lists.infradead.org; Thu, 27 Feb 2020 14:41:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 312FB295F73;
 Thu, 27 Feb 2020 14:41:19 +0000 (GMT)
Date: Thu, 27 Feb 2020 15:41:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v2 2/4] i3c: Add modalias sysfs attribute
Message-ID: <20200227154115.77c42274@collabora.com>
In-Reply-To: <a90f64f830128cd12762153de7828b775574c156.1582796652.git.vitor.soares@synopsys.com>
References: <cover.1582796652.git.vitor.soares@synopsys.com>
 <a90f64f830128cd12762153de7828b775574c156.1582796652.git.vitor.soares@synopsys.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_064125_501261_6927904A 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: linux-kernel@vger.kernel.org, pgaj@cadence.com,
 linux-i3c@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 27 Feb 2020 12:31:07 +0100
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Create modalias sysfs attribute for modalias devices.

					^i3c

No need to send a new version, I'll fix it when applying.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/master.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index b6db828..925e1ed 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -241,12 +241,34 @@ static ssize_t hdrcap_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(hdrcap);
>  
> +static ssize_t modalias_show(struct device *dev,
> +			     struct device_attribute *da, char *buf)
> +{
> +	struct i3c_device *i3c = dev_to_i3cdev(dev);
> +	struct i3c_device_info devinfo;
> +	u16 manuf, part, ext;
> +
> +	i3c_device_get_info(i3c, &devinfo);
> +	manuf = I3C_PID_MANUF_ID(devinfo.pid);
> +	part = I3C_PID_PART_ID(devinfo.pid);
> +	ext = I3C_PID_EXTRA_INFO(devinfo.pid);
> +
> +	if (I3C_PID_RND_LOWER_32BITS(devinfo.pid))
> +		return sprintf(buf, "i3c:dcr%02Xmanuf%04X", devinfo.dcr,
> +			       manuf);
> +
> +	return sprintf(buf, "i3c:dcr%02Xmanuf%04Xpart%04Xext%04X",
> +		       devinfo.dcr, manuf, part, ext);
> +}
> +static DEVICE_ATTR_RO(modalias);
> +
>  static struct attribute *i3c_device_attrs[] = {
>  	&dev_attr_bcr.attr,
>  	&dev_attr_dcr.attr,
>  	&dev_attr_pid.attr,
>  	&dev_attr_dynamic_address.attr,
>  	&dev_attr_hdrcap.attr,
> +	&dev_attr_modalias.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(i3c_device);


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
