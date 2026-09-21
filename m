Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAADC982E6
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zv6Z5FAcHrwiuYxOCukf3nVMUX/SJ43tXOErVNAIWKs=; b=uQVwPc6t+tupTr
	yzrIBejMAx/s9EEM2W3b+uY4wXuFCrUKi9FKMnVpQuztOd8XOJwHiBAG6S/SZ/+jZpNmVJDsc+rTk
	fI1g97+rLnv5RxUCidlQiC4Y/6A+JVU9uj9RH8g2LTDLpCeCXCKfa0i3NyoeiwDWqMbCK4+nXrVN/
	JSG+tO3WfuIvdqto/JSc9a56fJBJQHh1hilj+d4TJWfbcjC4rG4TywoueQqlrsF90xWndG6YnVOhO
	cHAUrEaGzeok12M0H/uzRYWW4ZDFFgE/7SjWU5drkCRBXwdfCj/9awcWrxP9pv4OQzUi+jqkklx+J
	UHusuRSwWEb6B7ki99nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lXd-00000003SkK-2as2;
	Mon, 21 Sep 2026 21:27:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lXa-00000003SjK-15Jt
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 21:27:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 879E9C23D9D;
	Mon, 21 Sep 2026 21:27:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18CE75FFB2;
	Mon, 21 Sep 2026 21:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B478B10328621;
	Mon, 21 Sep 2026 23:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790026026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Q/GyYI2xeCVFBXznT89exHyYCOANPeZxgg+pLy1DnkM=;
	b=AmBFndJN8l2JrpCCRUkheHXZ1WM3r62XQAIg2F56DCx3nhDveEr9Uc7lyf9nT5MEALjMWP
	Wy7GLZkLbeBxBrCFoKVrm9XmvqXARYQgXiqa7JMTDgRbYP0lAY7dqAj05OaTwMddN8Si2m
	+2pxUzKbm5WSD1vhasfEoxOKduso+D3I+r02XxYZdUIFD+Q0G8/hEnANRB480nw09OVxGX
	XIp3nIVawmmqmiIqGgTVxOu4dTBOEKhrhZv1FAqBYXSQZZtZdBnVE3VLbUQSRPfSPvlyyB
	XBTsZAMnywZ/M0KE2ZIuG9/u5jVV2UQet9g+Hy22GGwfNDCgahCumxka7ejSnA==
Date: Mon, 21 Sep 2026 23:27:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 00/17] i3c: Fixes, cleanups and HDR-DDR support
Message-ID: <179002599322.269726.2488163716410715856.b4-ty@b4>
References: <20260920151248.46936-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260920151248.46936-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_142710_484295_5D37FF03 
X-CRM114-Status: GOOD (  10.68  )
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

On Sun, 20 Sep 2026 18:12:30 +0300, Adrian Hunter wrote:
> This series brings a collection of fixes, specification-conformance
> cleanups and feature additions to the I3C core and MIPI I3C HCI driver.
> 
> The first three patches are independent fixes tagged for stable. The
> remaining patches address a mixture of correctness issues in the core
> and HCI driver, improve conformance with the I3C and HCI
> specifications, add support for configurable device NACK retries, and
> finally add HDR-DDR support.
> 
> [...]

Applied, thanks!

[01/17] i3c: master: Fix out-of-bounds read in DMA bounce buffer setup
        https://git.kernel.org/i3c/c/35b028b25451
[02/17] i3c: mipi-i3c-hci: Bounce short reads irrespective of the IOMMU
        https://git.kernel.org/i3c/c/b1a25e8e143e
[03/17] i3c: mipi-i3c-hci-pci: Set drvdata before creating LTR sysfs attribute
        https://git.kernel.org/i3c/c/2bc2b1b89f65
[04/17] i3c: master: Match ACPI targets to the correct bus controller instance
        https://git.kernel.org/i3c/c/25648fb7cebb
[05/17] i3c: master: Remove stale GETSTATUS length check
        https://git.kernel.org/i3c/c/48d7187c98e8
[06/17] i3c: mipi-i3c-hci: Restore controller state if i3c_hci_enable_ibi() returns an error
        https://git.kernel.org/i3c/c/ad869331ac61
[07/17] i3c: mipi-i3c-hci: Send DISEC before disabling IBIs in hardware
        https://git.kernel.org/i3c/c/dcaabb080e0c
[08/17] i3c: mipi-i3c-hci: Fix runtime PM violation in i3c_hci_free_ibi()
        https://git.kernel.org/i3c/c/1570265b2257
[09/17] i3c: mipi-i3c-hci: Process multiple IBIs per interrupt
        https://git.kernel.org/i3c/c/5fbd0790af94
[10/17] i3c: mipi-i3c-hci: Move DMA suspend/resume callbacks
        https://git.kernel.org/i3c/c/ae307311a69e
[11/17] i3c: mipi-i3c-hci: Stop rings gracefully when suspending
        https://git.kernel.org/i3c/c/9796ccba1254
[12/17] i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0
        https://git.kernel.org/i3c/c/de243c3dd2e5
[13/17] i3c: mipi-i3c-hci: Remove invalid transfer size limit
        https://git.kernel.org/i3c/c/f3bd76ecb075
[14/17] i3c: mipi-i3c-hci: Remove invalid HDR-BT and Fm/Fm+ definitions
        https://git.kernel.org/i3c/c/8fe4a1b93aa9
[15/17] i3c: mipi-i3c-hci: Support configurable device NACK retries
        https://git.kernel.org/i3c/c/b7e849313eba
[16/17] i3c: Restrict HDR modes to those supported by the bus and target
        https://git.kernel.org/i3c/c/b968be9e7193
[17/17] i3c: mipi-i3c-hci: Add HDR-DDR support
        https://git.kernel.org/i3c/c/9b347cbde81c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
