Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A0CCD185
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Oct 2025 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvHtz6eIJAuTK2GbT2XLUds8MeD3Qgg5v4O41rwnSTg=; b=aZbmPH08zWylz7
	a0gyRfFdYZOOOKkh3+t0EDEyJzmLJsDsNjakMD+zqCXLJhcEQKH09kaHizPyMHtbg6psse9pmaFPU
	55u3ub5mT/oMRUYNuVMceGNHKRpRylfZn1+N/E91Ju0C1E7pMRgB8htiYPd5cgoRUqRvanvbUCRAq
	DET6ca+4G61sdEDnauhiou9RbnGSleWTBkDR4+ySJLMUHnnODltGPfWRpOenM04XeImyUhdoL/J2P
	pQoVYNyd7tonNUApd/HLTyKMu9BzkG3+D+CXyPDZxSvrmu3vyBl2qJqioLiH+bNzUUFIU7XwYYWC7
	wpi3jX0j4Xe26u5AaPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8OdX-0000000EKIm-3cet;
	Mon, 13 Oct 2025 19:55:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8OdT-0000000EKIM-3zkn
	for linux-i3c@lists.infradead.org;
	Mon, 13 Oct 2025 19:55:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 60C4FC093B5;
	Mon, 13 Oct 2025 19:54:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45DA66067B;
	Mon, 13 Oct 2025 19:55:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10BD9102F227A;
	Mon, 13 Oct 2025 21:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760385305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ueA4Mw4ZvAdPduByR8LCFz7NV7MIajA8VN4BjDi+iYc=;
	b=tSMPaCM3u/5AMWi6C2uaGeO7nteYc8EWKCbf8Atx+55xMokblB8D7uyqQUIN5UN0VCyf8M
	92rSu2RHAMygLwiTzDHbfNr6o39la14ofppeSKWml+FP2LeSBi+tMVaA9t21CfewwODbPY
	O2iuzUWMZ9m3sdCASDH/6F85ruQDAszHZA2BlFfDdR01oDoTOGJcZVTzMKsl+PR7xrtB/u
	kCvU5b6eyw7dGzYrzu/ZYfz+585J2Rmp3YyycCPmvrqpkvXzI4JJICjnHtrTPDlVVxjYUD
	8Lnbu5vdBtJDAqrcnk19G+o0IESLUGkvny+JXMAEGdeZnfZ8WdPwOeSuFhLf8w==
Date: Mon, 13 Oct 2025 21:54:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v5 0/5] i3c: Add basic HDR mode support
Message-ID: <2025101319545551cfb399@mail.local>
References: <20251007-i3c_ddr-v5-0-444184f7725e@nxp.com>
 <20251012180327.5d94dda2@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251012180327.5d94dda2@jic23-huawei>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_125512_530486_2131C503 
X-CRM114-Status: GOOD (  15.42  )
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

On 12/10/2025 18:03:27+0100, Jonathan Cameron wrote:
> On Tue, 07 Oct 2025 16:06:12 -0400
> Frank Li <Frank.Li@nxp.com> wrote:
> 
> > Add basic HDR mode support, only support private transfer, not support
> > CCC command.
> > 
> > Update i3c framework API to allow pass down mode and extend driver callback
> > function.
> > 
> > Implement HDR transfer in svc i3c master driver.
> > 
> > Simplifed HDR flow is (ref i3c spec line 5514) Figure 129
> > 
> > <--              SDR            ---> | <--- HDR
> > START 0x7E RnW(0) ACK CCC(ENTHDR0) T   HDR-CMD(00-7f write, 80--ff read)
> > 
> >                                     ----> |  
> > HDR-DATA HDR-CRC HDR-RESTART .... HDR-EXIT
> > 
> > Note: HDR-CMD is 16bit data, which included 7bit slave address and 8bit
> > read/write command.
> > 
> > svc hardware can auto issue SDR part.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Whilst there will probably have to be a v6 for the ACPI ID issue in patch 5,
> I'd like to ask the question of how are we planning to merge this?
> 
> Maybe an immutable branch either in IIO or I3C trees that the other one picks up?
> 
> It's a new driver so could gamble on taking the IIO driver the I3C tree but even
> then I'd like a topic / immutable branch in case any IIO wide refactors or similar
> hit this cycle.
> 

I can definitively provide an immutable branch once this goes in or if
you are more comfortable with this, I guess there is no urgency and we
could apply this over two cycles, first the I3C part and then you can
take the driver.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
