Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12262CD98C5
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Jun 2026 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HpQ+GVF5YioinGCsJERLbH/EgJcVBST/pvRKkEHFzE=; b=o6QmL+eIEdMBcr
	YvlWe/ff0Y0P7urokSarka0v1PHoKBDQwh2QqEtX1H5I94KWE8Po7jVbq3bkmmarIBIt/6pxQbSS+
	ePwATsHYkHsCgu4sTtkwOixBMVE+y7/K6PpvWkD+5/1PvBjpvRCr6M+Q/PZpvvaMbYdXw1p4bHcKZ
	zeEecSx4WBVNBqBYpnn5nT8qNNErNfTR4FvyfHshQTCxAZF8HWl4LLxzW4EmFlLQUcocFVVRhJE89
	bhh7ra5dURD+Hn2S/HlC95HrSge3DK1V3vIX/2DuWFxsqoZbBC/V2Npp3lzKt9jQmfwIQNTYb6Jv+
	6p0Xh0LNubu4Xgu2P6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrcS-0000000DHZN-3Auk;
	Sun, 14 Jun 2026 20:39:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYrcQ-0000000DHXv-1UJx
	for linux-i3c@lists.infradead.org;
	Sun, 14 Jun 2026 20:39:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 987F94E42EF7;
	Sun, 14 Jun 2026 20:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CD0060014;
	Sun, 14 Jun 2026 20:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DCEF106C86AA;
	Sun, 14 Jun 2026 22:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781469584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h+mTa8sJ1zF0pDvXp19rKNfFl3OWCpSjbqooZuWICkQ=;
	b=FTWOj84/jP7BKGo1ZvZit4TM/JW9MdM5V3Z+neiUGBlEdaZ+vskIZLAUYhWwItHoZdGPI2
	somFJ0thSeKKFg/TY4g7sZTNW0WyrrQgMQ4H0OSbrNZ+7gjKxJOM8ZuPMfNOwll+uy+JxY
	1xyGepIaeffPu1Ata0qgMVjl9EVb2IU8CbRNlTIIYbR2yONcA9AvrQil7ODXlRwO8tvRVT
	+ANynuYGg/riUNqqGFMT8RpvUYELyjVjiMqNwO7oXMjMHVkoNX1/9Jouocvs+UzKdVfUXp
	jvIkown3FIXe4wffTVu9LZ02biPfLpym3AxWqIYUlrUFNvkwiCUuu1/SwbtGhQ==
Date: Sun, 14 Jun 2026 22:39:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Consistently define pci_device_ids using named
 initializers
Message-ID: <178146955562.340851.2387274692464339923.b4-ty@b4>
References: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_133946_532584_B90C9F28 
X-CRM114-Status: UNSURE (   6.79  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 04 May 2026 16:33:15 +0200, Uwe Kleine-K=F6nig (The Capable Hub) wr=
ote:
> The .driver_data member of the various struct pci_device_id arrays were
> initialized by list expressions. This isn't easily readable if you're
> not into PCI. Using named initializers is more explicit and thus easier
> to parse.
> =

> This change doesn't introduce changes to the compiled pci_device_id
> arrays. Tested on x86 and arm64.
> =

> [...]

Applied, thanks!

[1/1] i3c: Consistently define pci_device_ids using named initializers
      https://git.kernel.org/i3c/c/9972c11b2a1b

Best regards,

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
