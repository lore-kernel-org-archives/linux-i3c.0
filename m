Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1D4CDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WJtglltXLldlgah2lB8hi2FY/7bS7tFJKuHAKur0/c=; b=3YeI0G/n/VFaaq
	x5Tg4tGzXxxzCGskFHiF8DqmIrlb7q69MaEjXYYFA6S0ey0ZIM7MqOfCu0sD89R/X7Fpf5XUhQD3b
	JJO8lYsnC+hyGyEaMayFu+iB/NohlmCko0mHe0iEgBq8GyhQ0xXb1pB8wtMTb5xiv6RpwpIMbNxce
	iQoylZHfAXEN3PmZwZsrQBx9LDzZdrHcjx33DkUNoiyf3rqvuEJ7hdG17GE21PLWb9zTCjCTsMB4Y
	15YfHS2cyhR1YkGMpTPxcXF380gjSPvlWtaia4haHOJuu8le0HRSwnQu9GwUvsiyjaf+7DYiyKOse
	QcJRgTPdRaM8KkgTttjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskjQ-00CUq6-1p;
	Tue, 17 Oct 2023 14:07:36 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskjN-00CUp8-2c
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 14:07:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B55831BF209;
	Tue, 17 Oct 2023 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697551651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JN4ZGYYW38xpilPMmfTxgTyQKe9+4lxOfEsytKMKEQ=;
	b=L4flTNurZT4xkQl7CucQ+PvtwH2F8NnDAKIONZsu0uTx1usez8MsbvwKOrNqE9FxoxexVW
	5Ym2R8s5dttxQwt1tcvV6XGoKVB4t63pRBUCKPs/gXo4Fa3f8FjTEepAA0F7qjxueiZxpJ
	Q+fceWvpci8O2Uiz5/wPUzULytih6A+96MiPVSTYViwJnPC2vbt2IaAUfUzO0FzyX3CEGC
	DdVthaYI9pJOTQ0decuNvrb/Eg8MukKnKAe+Y7fFYiJ3cF80YAk5UcvAngF/isvMHMEC7s
	qsj8w3Z5sdXGYXuCGh4wM7wx4Z92wGAKDJjVoYNlnCyJ2EgR0Jp9taqtohA6Zw==
Date: Tue, 17 Oct 2023 16:07:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/5] i3c: svc: rename read_len as actual_len
Message-ID: <20231017160729.58984467@xps-13>
In-Reply-To: <20231016154632.2851957-4-Frank.Li@nxp.com>
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
	<20231016154632.2851957-4-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_070733_981946_C264D19E 
X-CRM114-Status: UNSURE (   5.94  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTYgT2N0IDIwMjMgMTE6
NDY6MzAgLTA0MDA6Cgo+IEkzQyB0cmFuc2ZlciwgdGFyZ2V0IGNhbiBlYXJseSB0ZXJtaW5hdGUg
dHJhbnNmZXIuCj4gSTJDIHRyYW5zZmVyLCB0YXJnZXQgY2FuIE5BQ0sgd3JpdGUgdHJhbnNmZXIu
Cj4gCj4gJ2FjdHVhbF9sZW4nIGlzIGJldHRlciBuYW1lIHRoYW4gJ3JlYWRfbGVuJy4KCkkgZG9u
J3QgZmluZCByZWFkX2xlbiBjb25mdXNpbmcgYmVjYXVzZSBpdCBtYXkgbWVhbiAiaG93IG11Y2gg
Ynl0ZXMKd2VyZSBhY3R1YWxseSByZWFkIiByYXRoZXIgdGhhbiAiaG93IG11Y2ggd2UgbmVlZCB0
byByZWFkIi4gQnV0IGlmCmFjdHVhbF9sZW4gc291bmRzIGJldHRlciwgSSdtIGZpbmUuCgpSZXZp
ZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCj4gCj4g
U2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+CgpUaGFua3MsCk1pcXXD
qGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
