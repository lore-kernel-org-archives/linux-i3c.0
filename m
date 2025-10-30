Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4761CCF9F8
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Oct 2025 17:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4w9aXiKjI89pMzEIR8e5AXsnw+Rk32++svRr0dS35+4=; b=gRE0Ca7o2tBXsV
	JhTz2zkG3cCuOcvdTltAAJoRPSUJ8GedU6kMj0Z8SvQL3sPbMPwRIExd3wuUF2vx29jbqzmRVW+h6
	BtgSIbrs1qIGVg6sGDMre0th10xEhmUInwASlBd5FzoskuYbY4XHOS5eibLgBa02XgCBgiBsl38n1
	La83scw1zOjESwXyjKsv+JfIz+00VNPOfaRVYg8BosgSQtCCpARsoNNi/rkQyqUSkpw9m23jBQh93
	Q2pjAmuY6mqkU521XIPgXJlDrY/QkKUfbG7VXfRBf0eMteI8ZW1x1A1yKIWf3GmtaCxJs6IE6eNWz
	tUmSMddEC/LltC28j/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEW9b-00000004W9U-1dfE;
	Thu, 30 Oct 2025 17:09:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEW9Y-00000004W8a-1T8l
	for linux-i3c@lists.infradead.org;
	Thu, 30 Oct 2025 17:09:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9E24AC0DABA;
	Thu, 30 Oct 2025 17:09:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0928460331;
	Thu, 30 Oct 2025 17:09:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF1D411808CCF;
	Thu, 30 Oct 2025 18:09:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761844171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ueUINSeERYMDlNo5jcT9YJikDS5HY4Egk6Xzi3ktbrk=;
	b=IWcG3iNLJg3miWAgUI4OIZJ0PqYFi7ScAgZyYXfaXb0VCfSv4wMA7gGuc6+YRIW6f0a4LW
	DWRjdNBGs99ci1NOHdaM945YZ+qONx6YUTI0/eOzljDj64x4x2N4IOf1guClxCF/3jZ55m
	hQIF+StGUWU5zgjyFVVn695K4JpUUDyzhYesax/JIR0mwQRu1dLIjrhZssGFA1xt1x3Qs4
	dEaPmPAzPiU8YHKA0gwVEnn3ukq/7Yfzn+KXuZTkUH8Eqc3g94qvbGVTrxnTjg6CahDX6g
	JNl7VOrmKQkDpYSfPpzOvFBXctQWvxbJLRt0fKEmT8CZnBWSw25vl36B2WEObQ==
Date: Thu, 30 Oct 2025 18:09:29 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: adrianhoyin.ng@altera.com, dinguyen@kernel.org, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] i3c: dw: add option to disable runtime PM for
 DesignWare I3C controller
Message-ID: <20251030170929b5991b7d@mail.local>
References: <22286d459959f2a153ac59d7da46794c0f495c77.1760579799.git.adrianhoyin.ng@altera.com>
 <20251016071051c3f647ce@mail.local>
 <aPCg0bFm4-DnmhAp@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPCg0bFm4-DnmhAp@shikoro>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_100936_558275_6D9A85A4 
X-CRM114-Status: GOOD (  21.47  )
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

On 16/10/2025 09:37:53+0200, Wolfram Sang wrote:
> 
> > > Add a new Kconfig option, DW_I3C_DISABLE_RUNTIME_PM, that allows
> > > disabling all runtime power management (PM) operations for the
> > > Synopsys DesignWare I3C controller. When this option is selected,
> > > the driver skips all runtime PM calls such as pm_runtime_enable(),
> > > pm_runtime_get(), and pm_runtime_put(), keeping the controller
> > > permanently active.
> > 
> > While the quirk may make sense, it definitively can't be activated by a
> > Kconfig option. This should rather be tied to a new compatible string or
> > a property.
> 
> I wondered why this is a quirk, at all, and not default behaviour. Is it
> because it works with some RPM implementations and not with others,
> depending on the platform?
> 
> But even if that is the case, it might be worth to opt-in for power
> management instead of opting-out for buggy behaviour. Because I would
> not assume that IBI have been thoroughly tested when a new platform
> using this driver gets upstream. So, the buggy behaviour may only be
> recognized later. Or?
> 

I guess it depends on how the IP has been integrated on the SoC, hence
my suggestion to tie this to a compatible string. opt-in or opt-out, I
don't care too much but seeing this seems to work for AMD, we need to
keep the existing behaviour for them.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
