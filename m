Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D8103E2E6
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 21:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/j5IAk3J/JjxD88sHuMnLODyY4g/+zWKAk8BHGbZP0w=; b=c+bKYm5xmxfZR4
	ObMzfUobvSFUsE8Z0M99ixHMhTWQXo1cOdXSIrJkrooLaNoTS/7iJtWBy3+fGAwZLFsUzUxeWb6Rv
	P8MxOjXJ96jDnVqE0oW1auuVzX7ap08wd7z7lWBTiRyefA9f8sclU73f02ayZAauVTx8yJvoD4oo/
	KxCpNyWnYr0lNcCYJ/Gq5VAjUkTXeobG11OkPJEXjqimEtDV++YaaXazLZ8BLWkfeLLPWdM1xMZ8P
	nry5AGTFpHr2UgoS3WOCZsmGrXxsFDKQBaNU52FkJCjk+p8tST5TQI+9rcvXqqlsF4EiswHwO6ZsE
	OaMpTjNJcZ451sRNPpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Qre-0000000CXMU-0fwC;
	Wed, 11 Mar 2026 21:13:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Qra-0000000CXMB-1UQA
	for linux-i3c@lists.infradead.org;
	Wed, 11 Mar 2026 21:13:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C74A51A2DCF;
	Wed, 11 Mar 2026 21:13:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CE8360004;
	Wed, 11 Mar 2026 21:13:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E969610369BD3;
	Wed, 11 Mar 2026 22:12:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773263581; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fyto21RB+uOsc+uaLkgYs5zsOmmGTHcsDev3ONAp2yk=;
	b=lZuK1dmxzBA0sMO++Bj8WbOgdgxJXjQurVPGheENqvYdRWtjVcd4/jbd2ayegjsCH2R/2+
	wwf/dgGVZM1OSTsr5+Nl8QN14LEE0Sz7YvxT6W07WrPSOh1GzoRi6d/R0JPC97Tcc76IEe
	fvvGV0nKAxkauTM6oXQuX9KRKWLfSYTsPs0Zb9pjetttOVJULElVpsvL0zXFShtgujustF
	UJuJDlWUQpLUKm0LJIZb7uAASlEqfw9P3wMdLoddcFBgfoY1GUgeYDe2gB0Akah6xNpJZ3
	Pbs/Jh7tvKCtnwo/m/GBLnsqhMra1oUoGlkkjnULjz8ZoJR+m6nMZitzyoae6Q==
Date: Wed, 11 Mar 2026 22:12:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 00/14] i3c: mipi-i3c-hci: Fixes for v7.0
Message-ID: <177326357290.2374605.14652430560806898271.b4-ty@bootlin.com>
References: <20260306072451.11131-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306072451.11131-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_141306_905503_831953CC 
X-CRM114-Status: UNSURE (   9.13  )
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

On Fri, 06 Mar 2026 09:24:37 +0200, Adrian Hunter wrote:
>     Please note, all patches now have Frank's Reviewed-by.
> 
> 
> Here are some fixes to the MIPI I3C HCI driver.  Please consider them
> as fixes for v7.0.
> 
> They are mostly related to error recovery and a lack of serialization.
> 
> [...]

Applied, thanks!

[01/14] i3c: mipi-i3c-hci: Use ETIMEDOUT instead of ETIME for timeout errors
        https://git.kernel.org/abelloni/c/4167b8914463
[02/14] i3c: mipi-i3c-hci: Fix Hot-Join NACK
        https://git.kernel.org/abelloni/c/fa9586bd77ad
[03/14] i3c: mipi-i3c-hci: Factor out DMA mapping from queuing path
        https://git.kernel.org/abelloni/c/f3bcbfe1b8b0
[04/14] i3c: mipi-i3c-hci: Consolidate spinlocks
        https://git.kernel.org/abelloni/c/fa12bb903bc3
[05/14] i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers
        https://git.kernel.org/abelloni/c/4decbbc8a8cf
[06/14] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
        https://git.kernel.org/abelloni/c/1dca8aee80ee
[07/14] i3c: mipi-i3c-hci: Fix race between DMA ring dequeue and interrupt handler
        https://git.kernel.org/abelloni/c/f0b5159637ca
[08/14] i3c: mipi-i3c-hci: Correct RING_CTRL_ABORT handling in DMA dequeue
        https://git.kernel.org/abelloni/c/b795e68bf307
[09/14] i3c: mipi-i3c-hci: Add missing TID field to no-op command descriptor
        https://git.kernel.org/abelloni/c/ec3cfd835f7c
[10/14] i3c: mipi-i3c-hci: Restart DMA ring correctly after dequeue abort
        https://git.kernel.org/abelloni/c/b6d586431ae2
[11/14] i3c: mipi-i3c-hci: Consolidate common xfer processing logic
        https://git.kernel.org/abelloni/c/7ac45bc68f08
[12/14] i3c: mipi-i3c-hci: Fix race in DMA error handling in interrupt context
        https://git.kernel.org/abelloni/c/e44d2719225e
[13/14] i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
        https://git.kernel.org/abelloni/c/c6396b835a5e
[14/14] i3c: mipi-i3c-hci: Fallback to software reset when bus disable fails
        https://git.kernel.org/abelloni/c/9a258d1336f7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
