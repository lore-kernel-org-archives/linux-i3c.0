Return-Path: <SRS0=JVui=OD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE54EC433F5
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Sep 2021 17:51:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B5F610CC
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Sep 2021 17:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5B5F610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTpjm91quOKrfydoYKePPcx8ypVvKRegM88H4hFtubU=; b=3odh5p3EGg8Bg/
	B3sIR7j2SSUJRURlJIui6AqJqftLjsD3uuy0BNnq0+OlgnjO73T8pb958lrCXk+7LOJKRR7lyzfdC
	QFB9NbUaochXWnNbh1Btk+Mp9Tq5iP5WXmn5C3dWYJ6ZPNc82ZphT8t+7A/T2VLkwCCX8G+THY+t6
	6hsnKuJMefHjr3eL4Hq4p409X5FzfH6RFlAVQHslhR+EQ5Ud761CcdRU8xZOimao+ORPXW7nurRH9
	0w32HdyDyPGZ/mqfOr1yUFnKwmj1kIAvAj/njIyOdCxMwESqaffMzshO1UrHB20livcbxj1udBzwk
	a5g5YeJhOKM3QEE7Bd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPq77-002peb-JF; Mon, 13 Sep 2021 17:51:29 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPpvr-002kFw-B3
 for linux-i3c@lists.infradead.org; Mon, 13 Sep 2021 17:39:53 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B1470100008;
 Mon, 13 Sep 2021 17:39:46 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Len Baker <len.baker@gmx.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-i3c@lists.infradead.org, linux-hardening@vger.kernel.org,
 Nicolas Pitre <npitre@baylibre.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Prefer kcalloc over open coded
 arithmetic
Date: Mon, 13 Sep 2021 19:39:44 +0200
Message-Id: <163155475974.409020.13481298120131222771.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912155135.7541-1-len.baker@gmx.com>
References: <20210912155135.7541-1-len.baker@gmx.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_103951_551143_9E39E2CD 
X-CRM114-Status: UNSURE (   6.82  )
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

On Sun, 12 Sep 2021 17:51:35 +0200, Len Baker wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> [...]

Applied, thanks!

[1/1] i3c/master/mipi-i3c-hci: Prefer kcalloc over open coded arithmetic
      commit: 41a0430dd5ca65afdecf10fb0b8b56966a1c5d04

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
