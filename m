Return-Path: <SRS0=dXGV=GD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A2AC433DB
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Dec 2020 17:42:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AA2223DB
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Dec 2020 17:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30AA2223DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uAHNSLVJGGbQuTiaKZzfO0xvWvO28Q3Vpj6WCgMZueo=; b=Bz40bnCUIVa+XBuQhltoSirOQ
	+Ip3Ac/EMH0r45M0JZOkWJY/BBXzsLiivne0uDY7eBuPvBpA9tGhOIhyBTR3ZS+ODKwT3BMz8HAk3
	MZzb6PVu0Xtp73EQHC8L6/E+0QeQccuX0bKkuSRLSZFQjPcT8CsTSonIS0OIQPwpjuhIQJgiL9iOV
	UYNDDs+EHqfKXR7iatGi8LvBjJVzbKw99uA1lpdSPvDLkJpxIbdELL/2tadKkCha2tDADbC5tjUQK
	GEElh2kacOMy92zBFzpY9+TmJwCebqXZw7Ex1m2LkubCuvzMj5i9uncsEJ51hpcjL3eZeZ6W3gQb7
	Utn/t/WCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kv1y1-0005q2-4g; Thu, 31 Dec 2020 17:42:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kv1xy-0005pb-TE
 for linux-i3c@lists.infradead.org; Thu, 31 Dec 2020 17:42:28 +0000
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr
 [86.202.109.140])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 741A7C0003;
 Thu, 31 Dec 2020 17:42:23 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Fix position of __maybe_unused
 in i3c_hci_of_match
Date: Thu, 31 Dec 2020 18:42:23 +0100
Message-Id: <160943653614.132002.12499200411415721355.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222025931.3043480-1-natechancellor@gmail.com>
References: <20201222025931.3043480-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_124227_101385_F48FF2B1 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Pitre <npitre@baylibre.com>, clang-built-linux@googlegroups.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 21 Dec 2020 19:59:31 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>  ../drivers/i3c/master/mipi-i3c-hci/core.c:780:21: warning: attribute
>  declaration must precede definition [-Wignored-attributes]
>  static const struct __maybe_unused of_device_id i3c_hci_of_match[] = {
>                      ^
>  ../include/linux/compiler_attributes.h:267:56: note: expanded from macro
>  '__maybe_unused'
>  #define __maybe_unused                  __attribute__((__unused__))
>                                                         ^
>  ../include/linux/mod_devicetable.h:262:8: note: previous definition is
>  here
>  struct of_device_id {
>         ^
> 1 warning generated.
> 
> [...]

Applied, thanks!

[1/1] i3c/master/mipi-i3c-hci: Fix position of __maybe_unused in i3c_hci_of_match
      commit: 291b5c9870fc546376d69cf792b7885cd0c9c1b3

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
