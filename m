Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18651103E2E7
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 22:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NF/c5Ms9HN18qq2kC8IE+zWCnTRzIx1zVPZ3c4VIs8w=; b=QVixNu3VuXEd4d
	iStEi9slEA9+rCbCCc/fGjyHforYKUoRRX11qAPvjLO5sB08NcqPglcKAaQuqexDJC3cVvFCFxN+T
	y9qnoba7eEcIjftL+xnQq6HLvyL3fVWHc4mFLbI8A3RlW7Ddd80EhZttdXNep7JB5FwB5vVWYdYeR
	PC0ISpEI21MKOHUEwKFM29jyaj7ZdbQ+Z2ABoiT82iJnbYyudNFoYEvMyT8iDsQb2NnnqHTts0pt6
	7aPuH3QWvlb/IseAIpnFKlHy8WxXhvv67Grj3OKSb4jOulG14AFj1KKNTjsel/+a+WMNv7ixHgwD7
	bHrX13bgNIjtIv/NFsBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rax-0000000CbEt-3XXr;
	Wed, 11 Mar 2026 21:59:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rau-0000000CbDB-3YW9
	for linux-i3c@lists.infradead.org;
	Wed, 11 Mar 2026 21:59:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7D4984E42630;
	Wed, 11 Mar 2026 21:59:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3385760004;
	Wed, 11 Mar 2026 21:59:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82E7510369BDC;
	Wed, 11 Mar 2026 22:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773266390; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bitzxsJZS3YcjhqltLrf29qDuPuk/9HB+bkYA7oDH8U=;
	b=VVSKz45GQavSOsc7B1VqdLVpWn+Pp/7rak2ur108jXkyF4ySPzPiFiiOPz3OhRZJc+5Ejc
	NMg/GmVdUG/Q5Q3tEnBgzL2n05U+4SitVy2WSY7tswB9ZXNarEOLkB2BSaxK8UiHxwLA1x
	BqHaB6ONjg0m70YHWatD3514DXLwGymgCmyVE1JwaAE0ecrsfOVMaSi8St+rJF6ZK8HyKM
	qmUti9V3QFbXmuhlnTPFUzzGrnLDOnbs/mTcaL3aqupV/4mfoibiUuT3w/DiwUGcQaACP6
	c/pjc4zM/YHycOC6IXoDFOkt4srcBFqQx1J4xHGgrNl6qja0qIf5w/M/XsgqCA==
Date: Wed, 11 Mar 2026 22:59:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joshua Yeong <joshua.yeong@starfivetech.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Subject: Re: [PATCH v6] i3c: master: Add sysfs option to rescan bus via entdaa
Message-ID: <177326636989.2391121.4677756170185964877.b4-ty@bootlin.com>
References: <20260219-i3c_rescan-v6-1-b81d6cc3cb30@est.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260219-i3c_rescan-v6-1-b81d6cc3cb30@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_145957_040458_7FAC0406 
X-CRM114-Status: UNSURE (   6.22  )
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

On Thu, 19 Feb 2026 21:58:03 +0100, David Nystr=F6m wrote:
> Allow userspace to request dynamic address assignment, which is
> useful for i3cdev devices with broken hot-join support.
> This will assign dynamic addresses to all devices on the I3C bus
> which are currently unassigned.
> =

> =


Applied, thanks!

[1/1] i3c: master: Add sysfs option to rescan bus via entdaa
      https://git.kernel.org/i3c/c/fe47fb62cf32

Best regards,

-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
