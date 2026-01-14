Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C15CD37E3B
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DW9Koq6j3DRV3UYNEgVWjgkZ0mBSHYizGGG6f5p4RSs=; b=pcBFPiwEQzrb6z
	1zyyYcpSd4hAueGSBYJoIdTJTUt/NXQ1YuPKU/A3Gx1AGm1I/g1/J4HDFSunEwC/yNZgl9ZAcXkPA
	ZwUmU4xIU2YmY9dZOr7UVP+tkJIse8OjqQmntkUrzPybzE9+CY+LzvRssX8rntYBqZr7fF96eIy1T
	g33VGhrnpKLZLKNDZmOENV1df5jE7rQOcxl6qvZwtHNGXnCxWsjED5xrslXavYlFSLiPI2Mzwl/yB
	uDI4N2Fl/Mk3JCBLTg+xH5LJBQOxl+FooIDjrq1wvUOgXvsyoxKBLJ/7f3TsIm+l3+8WPylLS4cQR
	+9t1ZYEKeY2UOIo49B0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2Nb-00000009bgE-0DFw;
	Wed, 14 Jan 2026 15:01:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2NX-00000009bfE-16QW
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 15:01:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 40E94C1F1C4
	for <linux-i3c@lists.infradead.org>; Wed, 14 Jan 2026 15:01:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE4F66074A;
	Wed, 14 Jan 2026 15:01:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 105ED10B68265;
	Wed, 14 Jan 2026 16:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=zpTrPinS6kT/b3XQ5VJ6xSWrB525gcc/RJI07ue++eo=;
	b=DSKs3EDfqqWLGAEC2pV59QfnEOFw1F5NO9QdDjKC6Wn/5hqfR36qHEXdAm+L0O5uLD0jjq
	FIge7XDAGdlY8zHZyKfkYeb2I4oV3Xjn9eE4fLgfIeWJkZb8mHDKoHTIF5qzKS/y1ct4io
	fIUJa86fD5qpSY5HBKTkXg3fUrT13Pk/Z8nLoo/4d5x3FIxjQkYLKADgjTI4Il+AcZtfwd
	BQHrg1xU7yYlKjiO0Tru7N47fJcMPPBdALyb7m+87qOtkj/XrWrVm00CTBFvDn+UF0yXCI
	RcBVXYnAcYYorCaOe2sIWabC0m4vMUmNC+RENDVgT+N5rC9ITV8ioMa1Cn9Jnw==
Date: Wed, 14 Jan 2026 16:01:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V4 00/11] i3c: mipi-i3c-hci-pci: Define Multi-Bus
 Instances for Intel controllers
Message-ID: <176840281753.1259180.16682443849111984597.b4-ty@bootlin.com>
References: <20260106164416.67074-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106164416.67074-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_070147_467468_ACE554E5 
X-CRM114-Status: UNSURE (   8.38  )
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

On Tue, 06 Jan 2026 18:44:05 +0200, Adrian Hunter wrote:
> All patches now have Frank's Rev'd-by
> 
> 
> Changes in V4:
> 	Add Frank's Rev'd-by for patches 5 - 8, 10 - 11
> 
> 
> [...]

Applied, thanks!

[01/11] i3c: mipi-i3c-hci: Remove duplicate blank lines
        https://git.kernel.org/i3c/c/840688d8e65c
[02/11] i3c: mipi-i3c-hci: Stop reading Extended Capabilities if capability ID is 0
        https://git.kernel.org/i3c/c/0818e4aa8fde
[03/11] i3c: mipi-i3c-hci: Quieten initialization messages
        https://git.kernel.org/i3c/c/581d5b7953b8
[04/11] i3c: mipi-i3c-hci-pci: Do not repeatedly check for NULL driver_data
        https://git.kernel.org/i3c/c/d540d090be8f
[05/11] i3c: mipi-i3c-hci-pci: Enable MSI support
        https://git.kernel.org/i3c/c/b43181b724e8
[06/11] i3c: mipi-i3c-hci-pci: Assign unique device names and IDs for Intel LPSS I3C
        https://git.kernel.org/i3c/c/35c0bfe8fd10
[07/11] i3c: mipi-i3c-hci: Allow for Multi-Bus Instances
        https://git.kernel.org/i3c/c/b8460480f62e
[08/11] i3c: mipi-i3c-hci-pci: Pass base regs as platform data to i3c core device
        https://git.kernel.org/i3c/c/9a4d56b42ff0
[09/11] i3c: mipi-i3c-hci-pci: Convert to MFD driver
        https://git.kernel.org/i3c/c/0590fe32f904
[10/11] i3c: mipi-i3c-hci-pci: Add support for Multi-Bus Instances
        https://git.kernel.org/i3c/c/9b1679028e76
[11/11] i3c: mipi-i3c-hci-pci: Define Multi-Bus instances for supported controllers
        https://git.kernel.org/i3c/c/540a55a5bafd

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
