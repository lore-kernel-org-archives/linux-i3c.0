Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF814C27C4F
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3Hk7yUQhFr/YC4HQNjIb1LeE940TwKgK9UU3OoQihw=; b=WnijKbppX2bXi4
	tEUoqZDJttNdKxYoyQW1WBzYy/pOZsmj1b1HCScBZy3rNtaL0iIeQhTRs7v8FRlgMpVjdd6AC++IK
	TYx4BhbL9btoLYhRAx9588XRADZtSl7zYyt+EwM7z8YfWM+FmovZOU/zRi5YVSTbV7jOhVzqsMHDZ
	4IK73uthNTV9GE9KWQMI4Z2dR1TQv4MYfKN5HwFnhxclqo3QXURonfksmt0EbqGnvbKTg4cTLrcMi
	OKsbIwB7ECitlofuAz2l9MfcTDpUDJN8fOmkoK2Iv7U+vB//sAH+kJ6TSuljKuk1P1hNcXUwPcizI
	Ut2o3SmwDWJUkOd1Fxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPp8-00000006JX9-10c0;
	Wed, 26 Jun 2024 10:24:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPp4-00000006JVu-2hiC
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 10:24:20 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 16D50200EE;
	Wed, 26 Jun 2024 18:24:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719397454;
	bh=Z9OEb+W758nrFwD4DhnTTZ3Php5ucgAJEIdfGNrKUnY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZMkT1QN8UFT0Fak1pLNlBYR6DfHHiVP7NAtk5ixPxEbOhlTV+BU+KVQQkiuZlfdaW
	 B9p5nM8pzH9wkTX2ZcU6/3iNY4qBxZfAE/mPXSrbsLNcFGb5GhmAzOgrCtz1jA/XNb
	 z7OyzlaWcPTXOiq9Cua1Gp3Si+KWkLbaOly3/2j9NxG/M+tkWBXKwpxciRserA0tDk
	 BzLtYRwFmWlCh+qHSsi/VsFkoUy6kZYUY+vdVPoF+t112z0bK3/NC7qGPxAFPIQ+s5
	 zt3uR9bbUedpsMFPDT/XlhKjQpusDxbXX8m24SHWhy+40UJWdTav8KZKU+8klIKQdB
	 QAjLCgQ0thUug==
Message-ID: <ce1786dd7c0e9b892ffdeed20eb0c1c9c0808984.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Aniket ." <aniketmaurya@google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-i3c@lists.infradead.org,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Wed, 26 Jun 2024 18:24:13 +0800
In-Reply-To: <CAMmmMt3DZWA734iFGLxz7cj+hYiWgq5MDOrc_UJpYeaij+yywg@mail.gmail.com>
References: <20240626052238.1577580-1-aniketmaurya@google.com>
	 <20240626052238.1577580-2-aniketmaurya@google.com>
	 <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
	 <c15045b4-2e5f-4fcc-b25c-76a5e4973e93@linaro.org>
	 <b4ba5fa7834fdfb1a1e26ff0e01b9bb235de63b5.camel@codeconstruct.com.au>
	 <CAMmmMt25nkZTXXLCVGv1baf3azQR0kwbM8LP4EzCQKOPLUhbVQ@mail.gmail.com>
	 <d256cd72ef2011c3bfd045b04fb6509d1ac827e9.camel@codeconstruct.com.au>
	 <CAMmmMt3DZWA734iFGLxz7cj+hYiWgq5MDOrc_UJpYeaij+yywg@mail.gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_032419_071794_F4ABB1A7 
X-CRM114-Status: UNSURE (   6.41  )
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

Hi Aniket,

> I am using dw core directly through Synopsys virtualizer development
> kit(VDK) setup.

Does that mean that *all* existing implementations of this design will
have IBI support? Changing this in the pre-existing driver will be
asserting that.

> Shall I remove the ibi_capable property from the dw_i3c_master
> struct?

Only if you can ensure it's not going to break the driver for existing
hardware deployments.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
