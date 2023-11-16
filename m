Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9685CC197A0
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Nov 2023 22:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giAWfkpnoaJcy58sgDcRW+AzPsDIYxXzfBjKxUZ9gbY=; b=CNjkerOlXRevvD
	Suje5s46f2RXAO6ORjo81xK8zu+d8gmMRS/f2+2xRV+FjL5LniYVrUP5KM9T/Pd+hGMLKAE9vrya0
	6K6XJjiOllaOx9vfmd9qBHgfEPcbtLEqLdOVoyYuxHyhNExNCXGXGAa0QIpRu3XfgYtaFGvaIEZS2
	gn4U5TNpwm/0jUNR4XiiAB5nW/t5d7dzix15N08F3aysWDUnrUNnOGgjj30FVVGYIKkGaRpNNpOdd
	QMhiGhF3dgf9esQh20V8I9ggEI0PFXbMheDzfIEOScPYAfPE5iQCl2peJosnOm2X63Qg1Vyrn2JDd
	klQz4+KUt5UHQgoVUVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3l21-0055mk-14;
	Thu, 16 Nov 2023 22:40:17 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3l1y-0055lB-2m
	for linux-i3c@lists.infradead.org;
	Thu, 16 Nov 2023 22:40:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 010791C0003;
	Thu, 16 Nov 2023 22:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700174410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PcI5DmxFweLocvZiTAD/rwWYJAn3IHIgKS4/i00jgWk=;
	b=R/e1dql5Z2pyCQp7Ckpgw3HAwGAwz/ryacwE2Hhc1bDUvca0WGUkkRKF+hS1PgQp6F7B0X
	JvAC9Vs73JtodNITVFuazDzWKjDfYggHlzQZcozLIZ9G0HXxO4VIRU05qfYuIEC+ruotns
	nTLK0r3+8issf09GQrWNWyLPGCZvFKgqSg42OEL0ki7wb/CnOOga3NzwShi1w2w/OKCzaD
	cAXfeSp/ptd7s0fs9Zao78iAxmhm66RRMjJYh4VNN4A1ys3VKc3k7NLOR53laZIzpHcsHo
	JK77KHd7m7y0D3mSA/Ehz4ZXRMtf0MPtcEOp2mbBnzTyqBbhwY38xCNR6C42zw==
Date: Thu, 16 Nov 2023 23:40:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/1] Fallback mechanism for GETMXDS CCC
Message-ID: <170017437282.331655.12906579286877237235.b4-ty@bootlin.com>
References: <20231114085525.6271-1-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231114085525.6271-1-joshua.yeong@starfivetech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_144015_046000_FC8BF56D 
X-CRM114-Status: UNSURE (   6.63  )
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


On Tue, 14 Nov 2023 16:55:24 +0800, Joshua Yeong wrote:
> Some I3C hardware does not support turnaround time in GETMXDS. Cadence IPs will
> perform validation against length of CCC returned. Similar hardware error were
> not seen in other IPs DW/SVC.
> 
> Joshua Yeong (1):
>   i3c: Add fallback method for GETMXDS CCC
> 
> [...]

Applied, thanks!

[1/1] i3c: Add fallback method for GETMXDS CCC
      commit: 2aac0bf4ebc8e09941bb2a40c0ce725437d9a82c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
