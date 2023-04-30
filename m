Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39151C77B7C
	for <linux-i3c@archiver.kernel.org>; Sun, 30 Apr 2023 21:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuI7ptoWiVlRRYwFsxmT2zrXoOhXGpzUPEMSiMgJ5a4=; b=wT+A5KDHK/kOQn
	MChxlT9s1JQHqQFiklSSFv8d0nyXXGYJ2IWoBBrBRD9jfp2pM2XupV0mGP8jiTzTkpqYVOnydsySQ
	HqBEPcb9SVPWjaLtUcGwOeIP1PcYNpEynQWbJiC59KrDOwSHYho9iBhKdRF+PtXxvBaH1BOX6ku9R
	TQ/9ahLiF+/S5ngnvasDLpfGJ5uJCDH6pW/W/fjTJ8VVI6fuujheh1QJbb3/42nsqn1yDBP7IsX+F
	RJw1WKfyDgLkvfM/tSs6XiqygkYjW9iyjmh9NB8EVuGE714ZG02umgMe5Qn/8JQ8mzpu+zGrAlRKt
	TLYuGcF2rv1lvD/YavTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptExp-00EqBn-0R;
	Sun, 30 Apr 2023 21:52:13 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptExl-00EqAW-1p
	for linux-i3c@lists.infradead.org;
	Sun, 30 Apr 2023 21:52:11 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5E1CBC0002;
	Sun, 30 Apr 2023 21:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682891521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNS6bTrYpPgW4eO7ylJ0uOc6JEAYmZn76L/XRnu+sso=;
	b=EaoMNzwyIp+wzM931r/MMCcgnYDeG7SooBPb1bDnmnHRvQHEcioMInNu7R4kWwbYyX5J7t
	buPPWM/THXlfhj6Vrrv5l8EK9Bd+dVZA/XgT1lFvHVqOU80WPTU3AxlcULzVY0gHvBouId
	CU+u0yzk5MzsOZ1wZpXcCBQvbrsCBY9KyK78v5M69nQ1TdRO3rQV34SR//tygymkAuqKq5
	QkQtKzv07jIV28hUJ8ITYVuf/uv9brjyNpdRwRZrgrmwG0ziNkTULzzm/pkUNmUTc0lhOy
	qdt0BGVOIT+aTBlPGs04qZ8otqt4XplTMISf0SPpKLRlpxSHjWEFks593IkTmg==
Date: Sun, 30 Apr 2023 23:51:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jk@codeconstruct.com.au, Tom Rix <trix@redhat.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: ast2600: set variable ast2600_i3c_ops
 storage-class-specifier to static
Message-ID: <168289147474.50482.8490566834895045084.b4-ty@bootlin.com>
References: <20230429134601.2688558-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230429134601.2688558-1-trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_145209_801865_5BE69B0C 
X-CRM114-Status: UNSURE (   7.60  )
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


On Sat, 29 Apr 2023 09:46:01 -0400, Tom Rix wrote:
> smatch reports
> drivers/i3c/master/ast2600-i3c-master.c:121:34: warning: symbol
>   'ast2600_i3c_ops' was not declared. Should it be static?
> 
> This variable is only used in its defining file, so it should be static.
> 
> 
> [...]

Applied, thanks!

[1/1] i3c: ast2600: set variable ast2600_i3c_ops storage-class-specifier to static
      commit: 6b496a94c5905fca7879bc0dc438a47de40b7d4f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
