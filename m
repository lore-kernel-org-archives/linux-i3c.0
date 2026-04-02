Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C22CC6B05
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CPcwkNaEXeR02N7NVyOvANHD6OJEkO0sE99YUbhy3Q=; b=f4iuijthPbK7hw
	Bnz5DORUwb2XKSNe3qKPtWPIxssIGf5+Mr05kkbe4LLR1WcqG1YqCcQlw9q4lZCZL+Wq0LtLaKewA
	RpTcgC+57ucEHgqr8gjJL1beZiFM5xUOBgFu+5iJsB6GL4hkA9aS/TUd1XfFG+1vNbzYy37jfGztS
	fATp+/nDd9HrFbTlmk3krje/lKwu0GcwBsEl/PBmKu8hBu6Cfu53iT6dYdUPKBZdN07+fhbV8lH7z
	GYw67QupBdz49fbUas9EXnc6P1uJWo1b/jUzH7Vr9kGckQxeHLeM3NnbaANSig07q2gQ9RjP+wflm
	YJ9DTPstqoA89Y5KcxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CH4-0000000H16D-2jUi;
	Thu, 02 Apr 2026 07:15:30 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CH0-0000000H14J-1zhK
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 07:15:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 84B81C59979;
	Thu,  2 Apr 2026 07:15:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B9155FDEB;
	Thu,  2 Apr 2026 07:15:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36F22104512D9;
	Thu,  2 Apr 2026 09:15:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775114121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wiKrDAWk4fSxvPGd0lY2pBYZ/Gb7wXMPPdOhaXRKJW4=;
	b=I/o4QYXfPbLflteyQTKBgqHu7wN1CIfFop9hl/h3U1rXFIrf2JLf5lqXgoQcWUCxLR3wgs
	RzYwuu80/JEPXQA/vyl7ce7xY4Q+tPtRMscjetcgXLLfXczjEsKvuR91qvRpkp4q112q8d
	2PpU8SsKtfPYLxQdi1+UvS9N3wEucrxvKIV/CiTpTqUMuYF0H/QKAKOHSpto0AsJvTZjeE
	gtWA5L3FwWKCuZzYR30UPli9GdtyO7D7buwMWbF0UxXZdZAZ/wzpNphNwJLvw0mfTmHkiK
	W26NUQkGWMmKh5PppQOwcn1A8G4s2DfNkYIxstZzJ193ct4ujorz2KajyokHPg==
Date: Thu, 2 Apr 2026 09:15:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Frank Li <Frank.li@nxp.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
Message-ID: <2026040207151741220dbd@mail.local>
References: <20260331-i3c-hci-dma-lock-v1-1-708bc5848381@aspeedtech.com>
 <acvg36HWslcwTFht@lizhi-Precision-Tower-5810>
 <OSQPR06MB725226DC6D102631B4D3E3A28B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <17efbe5d-6f9f-41b6-95ef-7a84e2ed5029@intel.com>
 <OSQPR06MB7252404199BA43EC56B684B48B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSQPR06MB7252404199BA43EC56B684B48B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_001527_003789_41CEEF6E 
X-CRM114-Status: UNSURE (   7.02  )
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

Hello,

On 01/04/2026 08:04:45+0000, Billy Tsai wrote:
> Hi Adrian,
> 
> Thank you for the clarification. I overlooked the lock in i3c_hci_irq_handler() in core.c.

Just to be clear, did you use AI to find the issue ?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
