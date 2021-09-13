Return-Path: <SRS0=JVui=OD=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF18C433EF
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Sep 2021 17:51:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A51A660EB4
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Sep 2021 17:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A51A660EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIb2zEUz7J+rDwecuui0iTYqiLz9gyncKY230MyDEhk=; b=QPHqAbdO+OmI1X
	l81joF+ZSeY8SW7Na0XaISTlNNVlZLIx3vRziVWglW5Lv6UCZWrcpeR8CE55yol+c/1srRaXfQTYq
	TKgz85xZUlI1e4oWErHkttDHoJBGxYE+39K1F5err8l6J3POOSy3MTMRVGzqFdMKvyHvwg8MJ3mpy
	8wjW8f5e33UvgbyELwrfVf7AEmLXpIZhM46XObOb4HpLpZr7HFqgl6kZC56qcrYEziFPqE5s/6EuR
	7mE6ds+guh7yvLAkQv0DwRtPuvgzFK6soqjEIPD05y0+5jQ7nolk4JObQHbfdnet+zjzIVg+XYVa9
	2ZPtab2AnZgYjCxyTDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPq78-002pf4-0H; Mon, 13 Sep 2021 17:51:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPpvs-002kH4-LE
 for linux-i3c@lists.infradead.org; Mon, 13 Sep 2021 17:39:54 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9065440005;
 Mon, 13 Sep 2021 17:39:49 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Len Baker <len.baker@gmx.com>, Nicolas Pitre <npitre@baylibre.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Prefer struct_size over open
 coded arithmetic
Date: Mon, 13 Sep 2021 19:39:45 +0200
Message-Id: <163155475974.409020.647490102226402116.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210905144054.5124-1-len.baker@gmx.com>
References: <20210905144054.5124-1-len.baker@gmx.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_103952_906281_18C9A4C3 
X-CRM114-Status: UNSURE (   6.36  )
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

On Sun, 5 Sep 2021 16:40:54 +0200, Len Baker wrote:
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

[1/1] i3c/master/mipi-i3c-hci: Prefer struct_size over open coded arithmetic
      commit: 605fa23646dd9a86c4300e1719542a865111d1b6

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
