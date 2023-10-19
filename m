Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798DECDB482
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FN3TN4/KI1Tpr33ZTihQjyobMk3jq7RFfOdo0PtmQ+E=; b=qNlEqsj3YiYU7F
	WgrssfkJMeFcKMMBCd+Hcma1DdeedCuCI7kLx3WZQZsdXxw+8286N1EZxV+OdR9FJV8GVmC0F4hRw
	kuYfMYLz2i3llDzjYOIXAi8t1hXJMk/5oPy+OGGGbru+hwqLsUUujmfgVSMn3fvZlcPjiZX5gnHp3
	3q7sCrriBjx81mcwFI5MmZUN6sGiUozL1HNZi1AUgNeq5u0/SCkp+I9nKktTwirSiwSYvjWSpiXUf
	wogD66AhzBsOaNqfXrfo7+8plTDL6k7eX6dJ47SOrk57V52EebsLWEJr7pGktAdlsAc5FFn0Ue70+
	oKQRND08mMjV9T8HCpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVEa-000F6j-0e;
	Thu, 19 Oct 2023 15:46:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVEU-000F3j-35
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 15:46:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 073046150E;
	Thu, 19 Oct 2023 15:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E061C433C8;
	Thu, 19 Oct 2023 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697730405;
	bh=dlXwrAmr23RZBJTQ4tZB3ILSltevA7NR468NS5iSreI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qd9oN9q3CDls1FHxrQ/fEHIzbFe3gGdXb9PwNIyIMVNdcHKeYaukZaB+ZRvCEElLa
	 IN5LRY41J2F9SBZ6c/hCI9wkG2d/He9mO/VpTf4aiVbz8OUqOpL6ZMkc7mc//znpQM
	 TuUnrJkSUHMZ4Zz2Q0AY/tlRHyf71pcP6uT6/L6w=
Date: Thu, 19 Oct 2023 17:46:42 +0200
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
Message-ID: <2023101935-papaya-legible-5849@gregkh>
References: <20231018215809.3477437-1-Frank.Li@nxp.com>
 <20231018215809.3477437-2-Frank.Li@nxp.com>
 <dd06c2d3-e273-4356-835b-42619543dfab@linaro.org>
 <ZTFE8hrRgPBrb7e3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTFE8hrRgPBrb7e3@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_084647_040497_0883B47C 
X-CRM114-Status: GOOD (  18.61  )
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

On Thu, Oct 19, 2023 at 11:02:10AM -0400, Frank Li wrote:
> On Thu, Oct 19, 2023 at 09:00:05AM +0200, Krzysztof Kozlowski wrote:
> > On 18/10/2023 23:58, Frank Li wrote:
> > > Introduce a new slave core layer in order to support slave functions in
> > > linux kernel. This comprises the controller library and function library.
> > > Controller library implements functions specific to an slave controller
> > > and function library implements functions specific to an slave function.
> > > 
> > > Introduce a new configfs entry to configure the slave function configuring
> > > and bind the slave function with slave controller.
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/i3c/Kconfig       |  26 ++
> > >  drivers/i3c/Makefile      |   2 +
> > >  drivers/i3c/i3c-cfs.c     | 389 +++++++++++++++++++++++++++++
> > >  drivers/i3c/slave.c       | 453 ++++++++++++++++++++++++++++++++++
> > >  include/linux/i3c/slave.h | 503 ++++++++++++++++++++++++++++++++++++++
> > >  5 files changed, 1373 insertions(+)
> > >  create mode 100644 drivers/i3c/i3c-cfs.c
> > >  create mode 100644 drivers/i3c/slave.c
> > >  create mode 100644 include/linux/i3c/slave.h
> > > 
> > > diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> > > index 30a441506f61c..d5f5ca7cd6a56 100644
> > > --- a/drivers/i3c/Kconfig
> > > +++ b/drivers/i3c/Kconfig
> > > @@ -22,3 +22,29 @@ menuconfig I3C
> > >  if I3C
> > >  source "drivers/i3c/master/Kconfig"
> > >  endif # I3C
> > > +
> > > +config I3C_SLAVE
> > 
> > It doesn't look like you follow Kernel naming convention (see coding style).
> 
> I checked I3C spec. It use words 'target'.
> Is it okay using I3C_TARGET?

Why wouldn't it be?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
