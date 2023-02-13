Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5616C64ED8
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUSNCR+rEmTk6XWsNtQ4cbQFAUjtpffM7zhO1bJdmtc=; b=D3MPYwKLG6lxtL
	9cZQWP9NM2l4PeR8ZkcJvKuLA2d6pAVYFpJVbIuDwrvL/LlF0N3CwZmJqo713s1J2GIpoXSSkHhUk
	cGqlv+c/s41eEY/lkkc0TEujaPV6nbCs1Q3L0A3GOO3T3PQPtwgFUiHb1rifQbQXqMcxS4JcwETnj
	V2M5Vfh5mGgqDkHR+q6VR+zav5bruiQfzROy8rfRCUafUjMaxOfAnfDdFO3bFGGUHTU6hph5YHxCU
	jHLCtKhD89Rto/oRqNA3lSViNPV4XBrrmetkgzfy9Q8xfDvf+WqIGR7InuFA3e/EHFHWBsDFQiViH
	n/wACDKPHlHk8d6irFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWEz-00E8os-S2; Mon, 13 Feb 2023 10:39:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRV1f-00DoS4-8d
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 09:21:33 +0000
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4175120034;
	Mon, 13 Feb 2023 17:21:29 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676280089;
	bh=xL/m04ySNSpKjFqiSAw/VBahvIfDK5HdjeVbiBcmgfk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RHsyzzFMmdmPkXEwVqXe/xZ47K+EgUknJgR/ve0ZqNOSXCOmvkc+pgrDWwKxy8gU7
	 zewJhb4ECO+dObwxXSY0Vqoe9P4VXt+mKSIXHnQUlt+R/GrG+Z6bt58K4B70qZI9A/
	 vsVtoQLlWPNpkZDxJmUFtnd6V3fuLvfOD9D5RWZ0O77yUNvLa/FrS/DP+R5pKVtxuU
	 kzI1I8zymRjC5EzVGj5K90cDAuNr6YoWX3lC5bKy49F0+nG0kVjjhX2yuWTJqnyEYq
	 Sf/E4gPRR3LWtUBlSsGEfHYCPK9nuik6/Q8PrJguRlzJ8cVmhreylKHF0mMwCWujqq
	 lh6xnorcpp6ZQ==
Message-ID: <80fa21969d9e0e7a123bd525199dbb40e79d47e3.camel@codeconstruct.com.au>
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	devicetree@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, Rob
 Herring <robh+dt@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dylan Hung
 <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
Date: Mon, 13 Feb 2023 17:21:28 +0800
In-Reply-To: <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
References: 	<5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
	 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
	 <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
	 <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_012131_534882_69571E37 
X-CRM114-Status: GOOD (  12.64  )
X-Mailman-Approved-At: Mon, 13 Feb 2023 02:39:18 -0800
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

Hi Krzysztof,

> You should clearly communicate that driver is coming...

OK.

> Anyway binding comes with the driver, otherwise how can we check that
> you actually implemented it?

I'll include this with the driver once we're past the RFC reviews.

> Please send patches, not RFC. RFC means you are uncertain this is even
> correct and you ask for generic discussion.

Yes, that's essentially what I'm looking for with this change -
particularly with the pullup config, which (as you say) could arguably
be a pinctrl config instead.

If we do decide to do this with pinctrl config, we'll need a separate
driver (and minimal binding) for the global register set to act as the pin
controller. That fundamentally changes the structure here - hence RFC.

> generic discussion comment - implement how other recent i3c bindings
> are implemented. This is basic device, there is nothing special here.

I'd say the global register set makes the binding layout a bit quirky,
as you've identified already.

> Since you did not respond to rest of comments, I assume you are going
> to implement them fully - including dropping the questioned
> properties.

Yep! Some of those will then be unneeded in this binding after going to a
pinctrl approach, and I'll make the fixes as you suggested.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
