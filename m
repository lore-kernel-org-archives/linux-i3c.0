Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F0FCDB465
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRtwGGVm636OtQrpwzFFKSaP+kvzOZzs0Zspz2R5Cz0=; b=lYCjKt+c8Ep29O
	3nZnblmv3vPCnAuhJZnzJcQTRYgP6zglI25cGsKiSwrR+Djk02u5djL2DcFVYuo+J7+31lCpBA2QV
	ssQFgWdZl9GEF/ypDuwyi54xTbv9YgCR8yERR98p9cm61rqHyxbmbmywLe60thqHP0Dp4uRbD3e2u
	LGacSExPn8357g5lczmmYE3/MCq5Y1HzYemQ8NhUEGcxK6aV6JNPxFbfzqypiPOgt3fAfhrwD1Qj3
	f7h7h7n7b/BA7Po7o6YKeJODl8/jwHvIRigIyos3I7U+Q1w4t47VLVm0uE88RbGNvQsdGigULIEtb
	GXFtd9Jf6tvBF3Cd0BkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWUA-000OCg-2J;
	Thu, 19 Oct 2023 17:07:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWU4-000OC3-0L
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 17:06:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 54ED5CE3014;
	Thu, 19 Oct 2023 17:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09122C433C8;
	Thu, 19 Oct 2023 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697735213;
	bh=OfIb+lpv0671Es84Qid81/qEM6OnY8JU1k800ZktAjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AyztDa4xFEDQBWGj65Eny50dOxSsQ8HfVh9mGYnsfdPITjjp5TSzmd2A61j18o0dZ
	 0OH2NgDcKYRk70r2SWg3NAm/rOgOveahn6ZTkwcDUpjG8VVkJ9U/0uEOWnHptksytO
	 ycG+Wl7shbxsg1ajy0vPnAk1ILawdVgiN87xg3w8=
Date: Thu, 19 Oct 2023 19:06:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, joe@perches.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	jirislaby@kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 1/5] i3c: add slave mode support
Message-ID: <2023101959-smile-oxidizing-7010@gregkh>
References: <20231018215809.3477437-1-Frank.Li@nxp.com>
 <20231018215809.3477437-2-Frank.Li@nxp.com>
 <dd06c2d3-e273-4356-835b-42619543dfab@linaro.org>
 <ZTFE8hrRgPBrb7e3@lizhi-Precision-Tower-5810>
 <2023101935-papaya-legible-5849@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023101935-papaya-legible-5849@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_100656_334536_5B9A505D 
X-CRM114-Status: GOOD (  21.52  )
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

On Thu, Oct 19, 2023 at 05:46:42PM +0200, Greg KH wrote:
> On Thu, Oct 19, 2023 at 11:02:10AM -0400, Frank Li wrote:
> > On Thu, Oct 19, 2023 at 09:00:05AM +0200, Krzysztof Kozlowski wrote:
> > > On 18/10/2023 23:58, Frank Li wrote:
> > > > Introduce a new slave core layer in order to support slave functions in
> > > > linux kernel. This comprises the controller library and function library.
> > > > Controller library implements functions specific to an slave controller
> > > > and function library implements functions specific to an slave function.
> > > > 
> > > > Introduce a new configfs entry to configure the slave function configuring
> > > > and bind the slave function with slave controller.
> > > > 
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  drivers/i3c/Kconfig       |  26 ++
> > > >  drivers/i3c/Makefile      |   2 +
> > > >  drivers/i3c/i3c-cfs.c     | 389 +++++++++++++++++++++++++++++
> > > >  drivers/i3c/slave.c       | 453 ++++++++++++++++++++++++++++++++++
> > > >  include/linux/i3c/slave.h | 503 ++++++++++++++++++++++++++++++++++++++
> > > >  5 files changed, 1373 insertions(+)
> > > >  create mode 100644 drivers/i3c/i3c-cfs.c
> > > >  create mode 100644 drivers/i3c/slave.c
> > > >  create mode 100644 include/linux/i3c/slave.h
> > > > 
> > > > diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> > > > index 30a441506f61c..d5f5ca7cd6a56 100644
> > > > --- a/drivers/i3c/Kconfig
> > > > +++ b/drivers/i3c/Kconfig
> > > > @@ -22,3 +22,29 @@ menuconfig I3C
> > > >  if I3C
> > > >  source "drivers/i3c/master/Kconfig"
> > > >  endif # I3C
> > > > +
> > > > +config I3C_SLAVE
> > > 
> > > It doesn't look like you follow Kernel naming convention (see coding style).
> > 
> > I checked I3C spec. It use words 'target'.
> > Is it okay using I3C_TARGET?
> 
> Why wouldn't it be?

Sorry, that was snotty of me, long day of driving, my apologies.  Yes,
please use "target" and the other terminology to reflect this, and not
the ones you used in your driver as it is against the current kernel
coding style rules.

thanks,

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
