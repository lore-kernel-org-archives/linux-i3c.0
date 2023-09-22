Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AE2CD4850
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Sep 2023 18:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kz2CEIU8xVfMB4/p8BFk+gIUAnqyoCTpJ4v/srGwg8Y=; b=Se4YWjrvop8rSe
	Cfl4ECxqP6bVbr0LM7ilfHKAkRp+pdAi6LHCc/z4J3Ry7ZXdbcNMelX1z03ajub5523WhqlM0b5JV
	RX0yACDWU12/SAB4Ks8grxV7sUDlHW32YWE9FjxhmE+CizqetolmuSnvrDKWamrXdb7c4S3Hv5CCF
	2aBg9/nJiNjxaIJF079iIEe9Cx2oCFbTZexitAo4BNpilQXMEaVzmJ1clKgoS/IZss02nVjOKzH/M
	swS1vtT9td2ALD5+OeHQzeQSDKJgizT4Kb+Ip0KoikdT5/rMhVRBNT82C0xdVkmrQaoErvBTHDnMQ
	KNF+dOFCw8DZ3OXPUvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjlCb-009f5P-2X;
	Fri, 22 Sep 2023 18:48:33 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjlCY-009f4i-2A
	for linux-i3c@lists.infradead.org;
	Fri, 22 Sep 2023 18:48:32 +0000
Received: from [IPv6:2a00:79e1:abc:12d:b80:57e1:5d19:4ce4] (unknown [104.133.8.100])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A2DC120173;
	Sat, 23 Sep 2023 02:48:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1695408500;
	bh=FSxf4hp6EbxHRe+fjQ74d1A0sweRTynwo9c3KieA1cU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YxMJ33g177H3ap8AxEHP+V5EeklnANu+CHfgwzfJFuixJZUoQCGU0fRS0VKta3uL7
	 D25TEv8wO3w50EeMpDzQy4V0EpCJpiHdyfSICwx+RkUoA+EHxiEwEpGCnfTcL44n34
	 PtuhmL+nxByJlHgdu34EMtlbLmWMRM9fjnxQ77Ct5sE09LN/WsvZrSx7bx+/fOu3js
	 8k3lDbWBsZITbCScaI3iqr3o4NKIpmrzSbnM8hAbkTm2im0JU2EyHwKt9aES8bG1dX
	 mZVvR8VVWIR/NWDEraYrOryhrn7So8w4yx7I5Ob/IdeuZNftw7lDqwIbOEBahKvjcs
	 cNzBTfnhrltWw==
Message-ID: <66b317e630f6904cbddbb8affcf06b59b4c0ead8.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i3c: dw: Annotate struct dw_i3c_xfer with __counted_by
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Kees Cook <keescook@chromium.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Joel Stanley <joel@jms.id.au>, linux-i3c@lists.infradead.org, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Matt Johnston
 <matt@codeconstruct.com.au>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Jack Chen <zenghuchen@google.com>,
 linux-kernel@vger.kernel.org,  llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
Date: Fri, 22 Sep 2023 11:48:11 -0700
In-Reply-To: <20230922175011.work.800-kees@kernel.org>
References: <20230922175011.work.800-kees@kernel.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_114830_929443_2AD6495F 
X-CRM114-Status: UNSURE (   4.24  )
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

Hi Kees,

> Prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with
> __counted_by can have their accesses bounds-checked at run-time
> checking via CONFIG_UBSAN_BOUNDS (for array indexing) and
> CONFIG_FORTIFY_SOURCE (for strcpy/memcpy- family functions).

Nice!

Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
