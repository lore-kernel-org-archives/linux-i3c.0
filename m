Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCF4C636D7
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMGIVulByvgL3t2EfYBaYKNlETJWZIooXNRVIxrnAcY=; b=vCxpCijz/AA09H
	k4jvQgLLIVJMhZAvonfWGGGBHMKAX8p1/Cly5O5UcdnwZefuLtmsojzWNLz5eXiiDxiV6YGoYZLT5
	5sH7ZWwQp+ChpfEnrS6zg3jgVAspB1OkhRxl/OGnXEa3fuwvHFynsTcugldgbVUYA8Kqdz7yaujRf
	8F3qMA1ExRs7MX+Vcm1gwzh2mKf3L57XRiyhVpQphwOKTD+kdjBcPloaAWLGOe+msO+tRugA5ajsM
	w4+SCrgxeU1xiuQwbCIJkBRVwdkvTE6CwOy9b5tKw5N5bav9eE61Dbcp61i7JMsIz3ZINLv1R60eQ
	chHB+PKfEr/0U/cioExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWEz-00E8oT-1c; Mon, 13 Feb 2023 10:39:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUcl-00DgEP-Sy
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 08:55:51 +0000
Received: from [172.16.71.140] (unknown [49.255.141.98])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5A8B220034;
	Mon, 13 Feb 2023 16:55:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676278542;
	bh=805Rlyhp1RvwvPx1kSRwx0ocdJBODymtJNL4keLIhvU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LPbOy8m+vOz21u/ZqcRYCITsCWtw7iYAuiL1myx3Wgio46FlBaOzOqWy47RTb3GPx
	 SIQxGux4Opl63nFvFOYNzVH+tjuxRKFqRc5+1Qld3UdD5SWHhSD+U90wGY3Gp0Ls1R
	 F95K2xOkfa74/izkYFVPCm5nZaCoV759ul8K6l28QptgU5trN1n4lQSNFCtMB6BfMJ
	 QVpeD1FwhvyykqveK7ztd9i5cwbY5DlXIC2L2jviHP1CXH1D5hFOXW0rrW3z8trKms
	 BdIkPxEnOU9rqrSn+0aqEVB+e+6EzTu+XLzz9tQ/Nw+/Nz49KoWE7gJYRMGlLmOvrM
	 /VoTtQsTYZZRQ==
Message-ID: <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
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
Date: Mon, 13 Feb 2023 16:55:38 +0800
In-Reply-To: <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
References: 	<5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
	 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_005548_334123_5B1ABD64 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

> 1. Do not use "This commit/patch".
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

OK.

> 2. Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the
> directory your patch is touching).

So "dt-bindings: i3c:" instead of just "d-bindings:" here.

> 3. Subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.

OK.

> 4. Where is the driver? Where is the DTS? Why do we want unused
> binding in the kernel?

The driver is coming next, but I wanted to sort out the structure of the
binding before committing to how the driver consumes the DT data - hence
the RFC.

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
