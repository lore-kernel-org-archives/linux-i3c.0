Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA66CED248
	for <linux-i3c@archiver.kernel.org>; Mon,  7 Oct 2024 22:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROmbxv1p7nfjbToeU0Z/Kj7BKvtp105angxVRFBVBrY=; b=NsWvPEys6/9dLl
	FSCSchSkMqrFWeBLYoiHje5/9M+mJZffK5Svdt6Nu6tZ2tEYPiaT74nAsCmLpnTuwzIK+5YYUf4x6
	T3Bo6ri3MoOc2OEu7/4bhOhcLa7tKXpuZl0r55k2hVaToLf7pG//yQ4620KGV6qIeG8dn/6TkbWpI
	0y5lzoNfYyM//GE9yluolZKK43DTnK9PZOp+PxkrZdX9s38Dc/S871crtEZTeXyuE2mq0WkNqJFEY
	yiOBhW4s7jM0pCHZKLNmLusYnF71OI/jSL43l1SdhM0L7FVpRVeZayafwHzMkjl2AcNoHLu3E2EUp
	Q9y26ZxZsFmY57NUwhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxwKB-00000003vkI-3lNb;
	Mon, 07 Oct 2024 22:35:31 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxwK7-00000003vgx-41v3
	for linux-i3c@lists.infradead.org;
	Mon, 07 Oct 2024 22:35:30 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e25d164854dso4139035276.2
        for <linux-i3c@lists.infradead.org>; Mon, 07 Oct 2024 15:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728340526; x=1728945326; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gesjil9Y0RZgbcjmX5qHd/S97rHztDCcedkOm+1cl0k=;
        b=FXdr9fOc0xcoQusNaOGpQZLfkrM44nloVL/PV8iknAP3Nequ+eFAKlK3DXqXas0iYJ
         scoBN5ICXkoZpkbXKsbiHN+RD2GgeeQrGWqAR39tsvR12d7Advai750/nfiOIZQwpDXd
         +45hchc4BWSGGqUv6BJALwfjTjvSO7B3MMFarsbCa3TdIuZ+P7y1WxyCSLi+pRLExWyC
         YD20zWS93VLyd5XhYNDqBZkpLVuoViZTxzueI19Jh8A5RC1+sjVTVFp2WCzoOapQ1bF+
         J+6Lpy0ON0rEDvkPPBaTGhKLect2BildQBbqfhQOLzx4PKaMnzzinVUn6Ink5NaBxtFo
         bIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728340526; x=1728945326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gesjil9Y0RZgbcjmX5qHd/S97rHztDCcedkOm+1cl0k=;
        b=sk5VI4/IIwN/1xPVpsKjjZXZfup6yi1svddsLKtxG9oxq0bc7FcFucMQp56/55nyMo
         gRpy2k2CeggIGBEML12sGU9WP79DGGxhgGNAaiRYJP0fOzMVqZXakSRuyAOPwKAlVPFG
         6K/LGXR3dOJXUuavRiuiat6ELzJILzWFynDVrM9kjxPYha06KToi9NtX2ppvcCFT3J6k
         iGEV1sqgh2UEUSbIAEFSGtrWI1zBrHJi05NSqJKam2f8zRT8hG56WmGZ76xFP5P7CUt+
         FhCiV2+eSoZXn9AwEVYIpvcvTIWmRtMOzeQ3eROMcyLfcrJ3LLvwryqdCUviwgysZLj2
         ETcw==
X-Forwarded-Encrypted: i=1; AJvYcCXOwIiYUyFvriABZaTCSjKWWyuDaRBr1qKasEBtcq9rxkYSvrhngMzzDzPbiFu3Skuzu7bHQ7Y3ph4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Te4hOUQ/14+n6YGBAngTOODnXuwJNW2H1CaDsNhd7MRttOr7
	uwWaXTZkPQxNeo9TE+jBfzeDju2Xn9R6VMmhVl8V+WFG+1F12BZPhrlHBHrtcHvgXhjamP6OLq/
	dH/etU5s3sUQrpHpm4ypTtKmsVlrE9kk69OFV5Q==
X-Google-Smtp-Source: AGHT+IGYLLRVc3CeXKReIUVnntYlZ+ULRb29gPUl3UTx4hoqAUGdx6q2aFDzdnacRWqcM/cOYseo4GoEdp7e3a8qLZE=
X-Received: by 2002:a05:6902:2305:b0:e28:6ec7:4353 with SMTP id
 3f1490d57ef6-e2893964043mr10612649276.54.1728340526338; Mon, 07 Oct 2024
 15:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com>
In-Reply-To: <20241007222502.GG30699@pendragon.ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 00:34:49 +0200
Message-ID: <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
	iommu@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, 
	asahi@lists.linux.dev, rafael@kernel.org, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_153528_049788_DED2CE39 
X-CRM114-Status: GOOD (  36.79  )
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

On Tue, 8 Oct 2024 at 00:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ulf,
>
> On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> > On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > > >
> > > > > Hello everyone,
> > > > >
> > > > > This set will switch the users of pm_runtime_put_autosuspend() to
> > > > > __pm_runtime_put_autosuspend() while the former will soon be re-purposed
> > > > > to include a call to pm_runtime_mark_last_busy(). The two are almost
> > > > > always used together, apart from bugs which are likely common. Going
> > > > > forward, most new users should be using pm_runtime_put_autosuspend().
> > > > >
> > > > > Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
> > > > > I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
> > > > > and pm_runtime_mark_last_busy().
> > > >
> > > > That sounds like it could cause a lot of churns.
> > > >
> > > > Why not add a new helper function that does the
> > > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > > things? Then we can start moving users over to this new interface,
> > > > rather than having this intermediate step?
> > >
> > > I think the API would be nicer if we used the shortest and simplest
> > > function names for the most common use cases. Following
> > > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
> > > most common use case. That's why I like Sakari's approach of repurposing
> > > pm_runtime_put_autosuspend(), and introducing
> > > __pm_runtime_put_autosuspend() for the odd cases where
> > > pm_runtime_mark_last_busy() shouldn't be called.
> >
> > Okay, so the reason for this approach is because we couldn't find a
> > short and descriptive name that could be used in favor of
> > pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> > you like it - or not. :-)
>
> I like the idea at least :-)
>
> > I don't know what options you guys discussed, but to me the entire
> > "autosuspend"-suffix isn't really that necessary in my opinion. There
> > are more ways than calling pm_runtime_put_autosuspend() that triggers
> > us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> > calling pm_runtime_put() has the similar effect.
>
> To be honest, I'm lost there. pm_runtime_put() calls
> __pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
> pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
> RPM_ASYNC | RPM_AUTO).

__pm_runtime_idle() ends up calling rpm_idle(), which may call
rpm_suspend() - if it succeeds to idle the device. In that case, it
tags on the RPM_AUTO flag in the call to rpm_suspend(). Quite similar
to what is happening when calling pm_runtime_put_autosuspend().

>
> >
> > Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> > during rpm_resume() too, for example. So why bother about having
> > "mark_last_busy" in the new name too.
> >
> > That said, my suggestion is simply "pm_runtime_put_suspend".
>
> Can we do even better, and make pm_runtime_put() to handle autosuspend
> automatically when autosuspend is enabled ?

As stated above, this is already the case.

>
> > If you don't like it, I will certainly not object to your current
> > approach, even if I think it leads to unnecessary churns.
> >
> > [...]
> >
> > Kind regards
> > Uffe
>
> --
> Regards,
>
> Laurent Pinchart

Kind regards
Uffe

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
