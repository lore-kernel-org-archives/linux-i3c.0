Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83875CE79A1
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 21:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6YwKUXhmBuw8QdXd8e0ojOM+p4giEvdASeYwQReCEg=; b=rJI+0ZtLJTp0tj
	7M/9DA+A69OBZihkEemqSCid5TMxa6sMQ81BdBLHLbmF3LwEazasehCZUtgq9EXE9Zhht6HCTYUYi
	oBpfSM53UanEpDNgk8UVs+4+BRDoZjkUvxylidoxueJPY+tLT1TH5CY9m0huFe1eiBCXCoCFqM2Fq
	nCeypLXTKaypPbFP+mDBZVjHUXl4PnCw7rHFP4FxGUsgQDCuC9JZU93uc2r+YLxvSIq7dwv4pjvPn
	cVup66XxbYjUTDawX178knLV9fx3tDSGWyWnYDTsGBpVE88bjkiUL3+57Cb6Uw2xl4Bq3mw5Kg+Tb
	vn6bX4b7f4hTeWn2uPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktGi-00F4Xg-0m;
	Mon, 25 Sep 2023 21:37:28 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktGd-00F4W2-2I
	for linux-i3c@lists.infradead.org;
	Mon, 25 Sep 2023 21:37:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21C7B1C0003;
	Mon, 25 Sep 2023 21:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+MbpunQASxv1AWuVJ9bN9SKqKRFM7WNZ5Xe2hEdzA5w=;
	b=kW7z5d9cqLL/D+DSp72pmvMhNhFtli2ArXy3l6x6qfw1/vvye6sToRUGoT5nDoSutPDcCu
	Anv0T/1pF+HZJAYULlu2Q4oKp/rJoZwXYjgdedZZceJHPTiHQJhnbI34yR0SWCDG97Xgdr
	1IfF9qFR+YWckOYk6LsgvNuiNe6Zss10Av0gF+XIhbyulrfUiDau0FXImzJTe4Ij5Ay9El
	SPA2qSTJRvU5V8IJtdSGQVMpuqbc/QCQZXY/a+P0akemUEoAloHx/AouF5KmU5qSbqK3yV
	3yfQN+tsuW+gEd38WS49VzVIV+4jZHrI1EUv6sOEahZLA+Mm2Y0KjKKU7alARA==
Date: Mon, 25 Sep 2023 23:37:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Kees Cook <keescook@chromium.org>
Cc: Conor Culhane <conor.culhane@silvaco.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: svc: Annotate struct svc_i3c_xfer with __counted_by
Message-ID: <169567773740.243402.6244573348098066977.b4-ty@bootlin.com>
References: <20230922175023.work.239-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922175023.work.239-kees@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_143723_889423_ED4223FD 
X-CRM114-Status: UNSURE (   7.34  )
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


On Fri, 22 Sep 2023 10:50:23 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct svc_i3c_xfer.
> 
> [...]

Applied, thanks!

[1/1] i3c: svc: Annotate struct svc_i3c_xfer with __counted_by
      commit: a8b163e184dede158c94f6392a406ac40a08fb1b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
