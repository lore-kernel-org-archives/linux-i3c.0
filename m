Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19282C83F10
	for <linux-i3c@archiver.kernel.org>; Sun, 27 Aug 2023 22:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcRlKocX/n3WqGyVoyk/6ttVJeM4XeG2g6aS6M3HG80=; b=3MhXALeIgUQARo
	vTjXrnt/Ckk/bKfuhbn/6VClcdFogONEQZ0UGmkaxr7jlG9aSERtfaeqDTdwIsSZ20F4TslxCEwC0
	dNxux/Yu6qxCZ0fV430WKyk+fFzrwB+rNJufHR/14kMdZMoj8yOJykvZVC8mHEWL57zbHzBSLGrMp
	KV4mlYtc9AsCMjIwwkRqYe8shs2AimTN6i6swp4qEPL7NCrCWH1eGcjO75SW6++mtYMtjNLmkG7Al
	BqbNu6sXe7Z/Czxo3n96uLiUX/MUyGoDJ5AcvWEEeyyaaiB68Y+xnmdN7xW0XqxgrOB0H7+97Cjr9
	ksIsKnxfLPOUZjtGP8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaOWz-008X1x-2e;
	Sun, 27 Aug 2023 22:46:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaOWx-008X1D-0C
	for linux-i3c@lists.infradead.org;
	Sun, 27 Aug 2023 22:46:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27E9840002;
	Sun, 27 Aug 2023 22:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693176406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RiM2QFhHnr1QFEOHj0sVy982q1bfnylCGYd4h2Dcdc8=;
	b=AzUkqyhepFmumOrPrNzLHjRVroBV4SEwQVw88W9dQQXOAKOU4kjDMSSkSrnrbpuPuBf2HW
	NPaENyvupE3W1l/ozZMwKuBb0g8h1v6hh9kCQDPVn8rkWopSd88e8/AJzWohisDj9xMFfB
	caQ51seMFsYipau/6/lbdd/aYkN3rw3w3yYwjQSBZgIWvUwF5eelW/5UGp6x413zU0DvUu
	Z5VJVPkfsA+m/SSrsouqHT4xSbdB7HPgq9TRRcV7Atwa2+IsM/jjKqkqihSLKFrvkqM4h9
	8WY8M2ehz7VeHJGhUYMv3qy6vNH4geYyJIOXIZEMtFSrDSbwVmzfLHegNN8zhQ==
Date: Mon, 28 Aug 2023 00:46:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	joychakr@google.com, manugautam@google.com
Subject: Re: [PATCH] i3c: master: Fix SETDASA process
Message-ID: <169317639314.563617.17285767371678104909.b4-ty@bootlin.com>
References: <20230822051938.2852567-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822051938.2852567-1-aniketmaurya@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_154651_241075_94F20B0C 
X-CRM114-Status: UNSURE (   8.36  )
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


On Tue, 22 Aug 2023 05:19:38 +0000, Aniket wrote:
> When a I3C DT node has a static_addr and an init_dyn_addr,the
> init_dyn_addr is reserved in i3c_master_bus_init() and then
> the static_addr is reserved in i3c_master_early_i3c_dev_add().
> But if the dynamic address is same as static then above
> procedure would fail.
> Add a check to pass i3c_bus_get_addr_slot_status() when static
> and dynamic address are equal.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Fix SETDASA process
      commit: c6a7550458922181bb922863d5f5feaf3c453fe5

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
