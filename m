Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E07CCE79A4
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZhcYU412xFAyTkS0eZNeDNNmrYP8DYrYZOWzheHJzg=; b=lrXOXiGADLVwhJ
	ky8igcuDNWkLJ7p1K/lSHzfPGU454PEVe2CBdbOYlxr3oDf6m9+kTuVQ2hq+wb1vBTwbwOFh5Sgoa
	FwcUnLjQa9nhD0ZaO3smgHsvVl83JqJB/oIka31iS6N9hRoCBPlWXjL/cqQnoY6ilHZrpzp/q9Pll
	UUPmPsPml46QZRnIz3FBVfgbe+B5IYKadpRpoqoVOWKsWXA0b75PBXAz7mDD21srstj3Oz8ei1zK+
	NvX10RWqMJS/jDGz5ADrZ00ruAe6YeyH+xetodhNghUGGW4ZAAeSeppsEYjxYF04XSe/6XEkBaZlF
	6X0oAeaNWoQ9CmueoZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktGW-00F4VM-0l;
	Mon, 25 Sep 2023 21:37:16 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktGT-00F4Ti-0P
	for linux-i3c@lists.infradead.org;
	Mon, 25 Sep 2023 21:37:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E7FFFF803;
	Mon, 25 Sep 2023 21:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nuNfFTwUasE9driIawJgjbLk0jLXch2OluzLAsaE/Oo=;
	b=UovMQhtl5npjGodKIzL9u/KvUv8aWeHtFvX+u8fGIUglJQllI+5VwrY0rVTJFfL6/5QcSj
	gvIuEGVlhpNwD4zchohwb6MMpzwU3KlQVnM7YC5J7c7oU/TnznmQjvRPi7e0kI8vmywBiN
	ea67GNb5QS/0skIojiAIEOT7fMx+hwhoszV59romJYJOLy+VIRyZMC5nlR+p9jAF+XwZze
	IJvCTxbB+HJ/LXffrnCi3+Npn1rpBAxfqvo4nle0+T0EH2MNxewOY9A1I7dQbkT8txnDz2
	5JgVAKVva0xdUA4kbTX4gkm9BnqLtcQBhihCDvLDdMsAf20s/ztP3UTmuEJYng==
Date: Mon, 25 Sep 2023 23:37:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nicolas Pitre <npitre@baylibre.com>, Len Baker <len.baker@gmx.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: Annotate struct hci_rings_data
 with __counted_by
Message-ID: <169567773739.243402.8781052948359275071.b4-ty@bootlin.com>
References: <20230922175019.work.129-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922175019.work.129-kees@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_143713_303401_1BCA2462 
X-CRM114-Status: UNSURE (   7.36  )
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


On Fri, 22 Sep 2023 10:50:19 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct hci_rings_data.
> 
> [...]

Applied, thanks!

[1/1] i3c/master/mipi-i3c-hci: Annotate struct hci_rings_data with __counted_by
      commit: 751d377f0f7a09d6122de0e2232133524568c52b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
