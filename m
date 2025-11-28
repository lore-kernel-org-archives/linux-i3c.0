Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80282D116E2
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Nov 2025 23:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgyCvOhYG+z5xp2lr3OMZYHn9TPeew+IAh8ubUi4A0I=; b=Hhg5keOhLjpNqA
	U79cygzjFBmro+TZqkP4fc5GZ4VtVRfjApkbwXaCVKPYalVT38+/fen7IkSPgMzwf6Pes7iA8zqod
	XbiiXxeaPX91r1yuBFsO0FtT8S07Mp8ql7XY1x/evb2+2j4tPiQMq2qiniGAjSBhZrFcGisUEj3Am
	/gfv6Fr3c4jrcYYTlGoCq31JN99TrW6fCFC5SlNKVG/3wg495Fip101og7xEKFa6JE0x/POT1uVmX
	f9MNQg4Gt7tEOX3fgWQXkm6MlshhvtnIrAO5HhlyeTWLXopEp8gxNTPrXngxBiBEzC1urnVIknuOT
	o3Xzj7fjPvlvsEVPnDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7iq-000000012WT-0e8G;
	Fri, 28 Nov 2025 23:17:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP7im-000000012Vp-23un
	for linux-i3c@lists.infradead.org;
	Fri, 28 Nov 2025 23:17:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8AE7DC15D6B;
	Fri, 28 Nov 2025 23:17:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66F8A60706;
	Fri, 28 Nov 2025 23:17:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C66B10B025DF;
	Sat, 29 Nov 2025 00:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764371862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=DUApqTvnCk3OGd7ko7BiEKAQkCu/JKH/myxYrjCfnlo=;
	b=uEMkv8X6PEmOJJPtHeRlVsFVMIN+Z7SZlrVV+cHyaQXIpFYjTZfuEctjk3pDXKYJE1FjYp
	cnBhAGSFsEB/XbAkAo5TsoFI4N88aCO5J9t5sKzXFubwoPmSm5fpXP5frAH3OiU0NHLLRN
	07FK3xRlRM66SYEVMmTsQpGp/OUT14gSsoswyexW0Hmy/KQRKaXDNaBALh0dY3i/bRU/6q
	CxN8qYAFRTrBYR61qJ99uMK7JXQiLlPp6IaaWZPwW0pkHOV4PzwPU2Jwv0DLqSLeg1C7g5
	EZEgBDOCN38D92bteBKsVEKmebMqIqvGbLTXsiuxRgkt/Nr1XXPStkkve5rRAA==
Date: Sat, 29 Nov 2025 00:17:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V5 00/12] i3c: mipi-i3c-hci-pci: Add LTR support for
 Intel controllers
Message-ID: <176437174534.880198.4557131958492439463.b4-ty@bootlin.com>
References: <20251128064038.55158-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251128064038.55158-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_151748_710034_15C25111 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

On Fri, 28 Nov 2025 08:40:26 +0200, Adrian Hunter wrote:
> Here are V5 patches primarily to add support for Latency Tolerance
> Reporting (LTR) for Intel controllers.  Most patches are small tidy-ups or
> preparation for the main change.  All patches have Frank's Rev'd-by.
> 
> 
> Changes in V5:
> 
> [...]

Applied, thanks!

[01/12] i3c: mipi-i3c-hci-pci: Set 64-bit DMA mask for Intel controllers
        https://git.kernel.org/abelloni/c/8c0522993925
[02/12] i3c: mipi-i3c-hci-pci: Move all Intel-related definitions together
        https://git.kernel.org/abelloni/c/f4fe6e708495
[03/12] i3c: mipi-i3c-hci-pci: Rename some Intel-related identifiers
        https://git.kernel.org/abelloni/c/58a9ae637112
[04/12] i3c: mipi-i3c-hci-pci: Use readl_poll_timeout()
        https://git.kernel.org/abelloni/c/36f18ae15cfd
[05/12] i3c: mipi-i3c-hci-pci: Constify driver data
        https://git.kernel.org/abelloni/c/fc6152dc777d
[06/12] i3c: mipi-i3c-hci-pci: Factor out private registers ioremapping
        https://git.kernel.org/abelloni/c/9dfa23c41510
[07/12] i3c: mipi-i3c-hci-pci: Factor out intel_reset()
        https://git.kernel.org/abelloni/c/6f6efdd15c67
[08/12] i3c: mipi-i3c-hci-pci: Allocate a structure for mipi_i3c_hci_pci device information
        https://git.kernel.org/abelloni/c/da8116a9be9b
[09/12] i3c: mipi-i3c-hci-pci: Change callback parameter
        https://git.kernel.org/abelloni/c/0f9ef14b3fb8
[10/12] i3c: mipi-i3c-hci-pci: Add exit callback
        https://git.kernel.org/abelloni/c/040dcd762d60
[11/12] i3c: mipi-i3c-hci-pci: Add LTR support for Intel controllers
        https://git.kernel.org/abelloni/c/884a33131f2a
[12/12] i3c: mipi-i3c-hci-pci: Set d3cold_delay to 0 for Intel controllers
        https://git.kernel.org/abelloni/c/a54b1aeb61de

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
