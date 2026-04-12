Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7AEE937E3
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6bA0x/gd6gET8o8r/bGRRLEAyqWbUGEw9R3UvrJn5E=; b=NADsa0zEpsUQrj
	eqdnZMyy0fq7LUQmsh5XTroGiYPWoBjHS8lHqBEDyXaXcLJwNZeBFgcycwCJPCY7aDyvZ9pLbuHNh
	0V9PDY00yIY4/R/p9LRLpPadQupcnbzyeMC6gIToR/2NapmbqfeyO6ltUgppwBb29KCW1txKpvs8N
	LIJn8lFYnqbJkIdkojxDOcEYr9S7LiRFgEr1lLgW3Tvp2KhTZf26YSkizoNrF/7nXpRfIunDN3zZi
	M5oMjUVwT1ABTvqUBSbJ002OW5jSKwbe+nXHvYXvjlJVca/8uQJl9SZBOGmxyk5b38y5vgMUyARSZ
	d0f1U3bEfOP228m/bTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvtH-0000000EOMq-3OUb;
	Sun, 12 Apr 2026 14:34:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvtE-0000000EOMR-3XBC
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 14:34:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0488C1A31B2;
	Sun, 12 Apr 2026 14:34:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3D185FFB9;
	Sun, 12 Apr 2026 14:34:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC6A610451B8E;
	Sun, 12 Apr 2026 16:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776004455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=91msdPNkWMnw/BAAIhlDZGhpLVxnZ2cz6aRipzbPmTE=;
	b=Mskiwlbxx4MqBlvN5B+uBf6kKoVpkkiwwdomK5No7A5b1gtWrV9NKl8diP9T2F+SVqgRPL
	7wFh99I5sz7CT8FObkQP36LnpB7i5jK2Zp68/kQz2+ooDvjDEjbmHhJw5o4xXzTtrVIlBY
	aAYUiLGzNaGiI/BMbb/+147XzUulpzRRRUcFDf9Bz21re6qMJR9mBDXWAOU6fhCaZZXzm9
	6nM6GFqmxJtFUkAFzJcGkZuag5KvbS6NOAc3ChYxpBXyz2o9xliYJe/9jkCImnzCxHqaua
	NHAE4S4sm1kjZvEVpfmllPexhgaW+QqiB/G+LZbOuE+eZLPNgNDPGT9PpHafsw==
Date: Sun, 12 Apr 2026 16:34:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, rafael@kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V5 0/5] i3c: mipi-i3c-hci-pci: Enable IBI while runtime
 suspended for Intel controllers
Message-ID: <177600443486.2783407.4838575164126519141.b4-ty@b4>
References: <20260306085338.62955-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306085338.62955-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_073421_034393_A8F5355E 
X-CRM114-Status: UNSURE (   5.84  )
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

On Fri, 06 Mar 2026 10:53:33 +0200, Adrian Hunter wrote:
> 	Please note all patches have Frank's Rev'd-by.
> 
> 
> Changes in V5:
> 
> 	Re-base on top of v7.0 fixes series:
> 		https://lore.kernel.org/linux-i3c/20260306072451.11131-1-adrian.hunter@intel.com/T
> 
> [...]

Applied, thanks!

[1/5] i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers
      https://git.kernel.org/i3c/c/815b4448198f
[2/5] i3c: mipi-i3c-hci: Add quirk to allow IBI while runtime suspended
      https://git.kernel.org/i3c/c/5fe77a6d8d5d
[3/5] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
      https://git.kernel.org/i3c/c/82851828a8b1
[4/5] i3c: mipi-i3c-hci-pci: Add optional ability to manage child runtime PM
      https://git.kernel.org/i3c/c/e813e7e30086
[5/5] i3c: mipi-i3c-hci-pci: Enable IBI while runtime suspended for Intel controllers
      https://git.kernel.org/i3c/c/e7a718627c6f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
