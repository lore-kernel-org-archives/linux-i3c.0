Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90705C5DF81
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 21:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKojxxoCaUuYyf5KNrDHQvz+vA8H80LtMmUrXCHMJxo=; b=dwQFoKH5JAIj+h
	NtLwoNFIGlF13Lm5jneaoRLsXBU3XjwFNkz5oaqes+HIg7FqgcHShd5XpX/yiXO6Xji3jM3YHReWw
	4TtUvUoRDNL/VKnncHuQHaAkdcMI11YD7l4BZVMUJDRUt0QWDc5HMC8px+8BzqwbR2erD7amPs6Qj
	Dexc+1erYg/KKNdEI6C6akcj4feKi3MiXu0sAv5j/zHY2/x+5ULdn7cVFGG8iSFMw338Lu9235UZb
	5KkX166FtW/2CKAxjNYLUsGS8MHbnGuykJCCImDSZ1KzbVOqf9c2ZJs8Yoh4acnrAgBEdErgHIHuM
	tUN77jCUlYGHBzg+TYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwR3o-00000008erl-0tBV;
	Tue, 18 Aug 2026 21:09:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwR3l-00000008erC-1sCN
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 21:09:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 06A401A1700;
	Tue, 18 Aug 2026 21:09:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF38860355;
	Tue, 18 Aug 2026 21:09:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2356211C74F7E;
	Tue, 18 Aug 2026 23:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787087359; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=HYHZZifrS9rjhaT1SNjFndr1X7qm6GHO8q8MMQ0lvuc=;
	b=au7LveI0VOql1fheK4Kyof0yE3X50KBF4Hs+K6d0mx8PZU8YtO8tHglfpI7VhCyS8NKQvQ
	/Wi8CxQepCsr61uozptXd4kJp7G50I39+FD23wO8QoWhvbTGBY0znov81FMCBlFFo/woEK
	dbQ2kp9RhpZyzPDelpgFbD5HHluFzWMsH4uNihBODe14D2B827x8G1O3+/3IPJJv6HX892
	wPYU6RpwAoFMuk4aZDgPqMcaQE9FibcsNXpgynFlHyQ2CRiLIBd5E49Fz88AL5wTfOM6ZM
	IfS0VqJPLlITemSbn4AClNGUFZ3JjaZ5x78vnyWRU3+LG2sLvVBnut0X1+i5nA==
Date: Tue, 18 Aug 2026 23:09:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: use COMMAND_PORT_TRANSFER_ARG instead of
 hardcoding
Message-ID: <178708733534.4064704.6920315386486505066.b4-ty@b4>
References: <20260813044225.22237-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260813044225.22237-1-jszhang@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_140925_628563_A102C5A2 
X-CRM114-Status: UNSURE (   5.62  )
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

On Thu, 13 Aug 2026 12:42:25 +0800, Jisheng Zhang wrote:
> Use the well defined COMMAND_PORT_TRANSFER_ARG macro instead of
> hardcoding '1'.

Applied, thanks!

[1/1] i3c: dw: use COMMAND_PORT_TRANSFER_ARG instead of hardcoding
      https://git.kernel.org/i3c/c/942e9a5b676e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
