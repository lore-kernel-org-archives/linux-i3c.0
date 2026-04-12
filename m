Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAA8E937E4
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snQBn7I9pRtHA7i8bm+Gsfn3YRUHZ+02Qz+dH4WRmKY=; b=L4JWI5K4DVEki+
	Di5S8eO+OCTybIPZ1vj/jIWGzbVvU95AMe6gsRpXprniEeljawmnXOX/wON8LFb+mQQfJLreYLaEM
	0dHhY94SXzRSl/PALyC/mLvrHHYAKmXqykhSYo5+U6i1k0ulUl22OC0GZlBHf+3kWknVFeJQN32eW
	NpH0Mf3IW2HB2v5tfjzOBCetHM78nZ0h8E7rUKJ3+zjBzheJwFL0KTrL/aHEmp38Tr4oXUOe0i6V3
	lbVWcu14WUGrQM5t8Zr7zfHlsOhwJ1JMP2qD3Bn45koYPIiWSJsZ2nFCUh23l5KHDXMXjekNGQu+2
	f6C1NlW87WOOtN2g0xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvyF-0000000EOg0-19Yw;
	Sun, 12 Apr 2026 14:39:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvyB-0000000EOfe-2kDP
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 14:39:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 59F6E4E42964;
	Sun, 12 Apr 2026 14:39:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EE725FFB9;
	Sun, 12 Apr 2026 14:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA09D10450084;
	Sun, 12 Apr 2026 16:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776004763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=/XvIqpATLe4i6qtf2Kgq2ESWlo6t8v2V0OOtrnl0KkI=;
	b=dgJLZ3gK0ThPgKHZ6haWMq9Rc5GbRAOPq6Yhw245S84vgMxq7C3aYvGiBIeP4Smc4Dt2CF
	L31suyycetabAMEYlrH+9S72+PFQ6w9niLLx0h+EbeeBX9wVGzJCtquXP5NysBIiG0H2EY
	W1TWddNU4BOiY+eMycEQCZAkTLEqNLbuS4WOovWclHnB/BKozFWBrMMuwa4utAUsM4xWaj
	QMNVKTn5mZXdoegF20ISX88VRzJCpNAh2fc9+05nSW9SN4xPpSrDTOoPFnmjqt2aQBpcy4
	F8cdWuqdeSiwqB4yBAqWrKkwzOCBR7WyQBcL2diVqaPtZWARUg7PABLwcl6Pcw==
Date: Sun, 12 Apr 2026 16:39:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: dw-i3c: Balance PM runtime usage count on
 probe failure
Message-ID: <177600475245.2784942.16957732277299275006.b4-ty@b4>
References: <20260321-dw-i3c-1-v1-1-821623aac7bb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260321-dw-i3c-1-v1-1-821623aac7bb@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_073927_856098_3DF939AF 
X-CRM114-Status: UNSURE (   6.19  )
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

On Sat, 21 Mar 2026 17:04:43 +0800, Felix Gu wrote:
> When DW_I3C_DISABLE_RUNTIME_PM_QUIRK is set, the probe function calls
> pm_runtime_get_noresume() to prevent runtime suspend. However, if
> i3c_master_register() fails, the error path does not balance this
> call, leaving the usage count incremented.
> 
> Add pm_runtime_put_noidle() in the error cleanup path to properly
> balance the usage count.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: dw-i3c: Balance PM runtime usage count on probe failure
      https://git.kernel.org/i3c/c/19d6dd322c3f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
