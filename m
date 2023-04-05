Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AF0C77B6E
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Apr 2023 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NS2uezLt6Cs4U7ab+O+8apOm3aDyIaOyDvYqOS/zGgw=; b=wv/8nFMuz31z1A
	DedFLbfBGaoJzXAQG1Ldz1M9tKCYW39A8qMeMGj7MXauyi599egNCZE/3sduiIvQSfgEyvTA1zpzp
	GdQbs4o7ImD+QD2Q4GjJeLHkT+MrulucNUwAImEoWwJqfLh+LaPRspHd37NkflE5gOMUTFdi+KYRb
	06+oE5KNuMFUlYGubjn0PdSMh/NuxJxjnuc0qNbQXoOUwq4lLyOTnbmEhWjchvsarEtZ/s4iV1Lw6
	DVbVLH7Ak4+S17MKWHfPFvmPFl/PyaRIRKiXIFWbGd7zN7jo8jrScgTmKgwCXHYlRQSgIBxagoI3k
	A3dMkR9BFfKg8jOrDI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMc9-006yfz-0o;
	Thu, 06 Apr 2023 10:13:09 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjvUq-003NeH-02
	for linux-i3c@lists.infradead.org;
	Wed, 05 Apr 2023 05:15:49 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 3098832009C6;
	Wed,  5 Apr 2023 01:15:35 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 05 Apr 2023 01:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680671734; x=1680758134; bh=6v
	64ejNYXJeppCTuGlXsPBwOd3VMLEXqppLm+O5trAM=; b=Tb9YIwt+35hT15bG5c
	R3shqWZL2nwxXq2PCkX4HPfL4QqBH9elvkUk5tpGcql104/NFrEtB/mKbQC5nNf1
	dE9VLFaJp34CFi+vKjtQ89ECMweRrqB4lq/aTWkZKZVovUAIJPg8ruhxiVo9gvYa
	pKqEhFq2BFuPtFdiGRZWp7RqAfBITcCdPStfzSMGfTL0vjyXYDT1Z53mDXDnf0lK
	0VcYt/iv92X9seCmUjZzuw0mQ6wqwCF4R7ZRaLX+Bu3ETbV7j5CzlMXZE8GlYSM9
	6WGFqXxQzUIfEDFpxLW3cY6LuM0iWnorXBteC6b5MU0mMiJTW6HLsv2edxCYWmig
	VKMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680671734; x=1680758134; bh=6v64ejNYXJepp
	CTuGlXsPBwOd3VMLEXqppLm+O5trAM=; b=O9zkWaF5losbbHszVuKuRSIW3wNtb
	i8k2uujXCa/IqsY+id8/+VUQbUaoR3MXUhkOLJEfZJtjggLnq9HpwT1HfYrg3dLg
	N4zC++3SqFtQsptm7bDoPMa/8xm5z91lpM+HoscpZ6A3f8uMfeVqqHsXXlz9wZii
	JN2tAhw6RpFR6j5q8Ve2/aID7RS6fb9S8NZLGjtD/2ZoiVPcuGoxasB3+YEKSbsr
	qFE4d4mYMlrMfo03mlFY0w2eX6T23XZzjhZ/nMoVVXoBAIBsAaCqmJieP3z/6jf3
	qTiIDNAGgx8ziDKDnEbIlWZ+gyPQpgb7c39eMYoNWWe8AlJsxM/5gykFw==
X-ME-Sender: <xms:9AMtZHNAzshuRWkUMSlJyYcOYizdGt6hU6Iyb2QXO4dwVscBETstgw>
    <xme:9AMtZB_fsjlhuZ9Yhc0_Y97uxe7zM-qK0rIR88QX5gKJ93A0P5NWiP2H5qyEO6uYn
    7EvSsD90_tWmRvRHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejtddgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:9AMtZGQyk88iPbSsvbuzu9ljhrRil7NVkmFRVtqb-Yt936wE-QPOKA>
    <xmx:9AMtZLu4BRLsoyJVRiUygktWVvAgZajwjvosXzwfc2nrWAcNbo81NQ>
    <xmx:9AMtZPdtD4O3XCXbP53VUBErnApXj9xSWys2KuWGU9_GuQ5GH2O0ZA>
    <xmx:9gMtZAVsGWp0GhiF3lcIdQUfQB-4txiIicsFL4HykTOw9wxYQaUX-w>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AA4BA17000A2; Wed,  5 Apr 2023 01:15:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <4da7a1d9-3047-453c-8a94-16f6ab524e57@betaapp.fastmail.com>
In-Reply-To:  <CACPK8XcPBCppbF8smOsO3csiWoomgheLHcudyNON3QDrwyguOw@mail.gmail.com>
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
 <CACPK8XdLpg2H4a2nHo4PokfBc4r3D8MbK2-62jXkPXAq8Q03Rg@mail.gmail.com>
 <94e941a2895bbb40d7b87acd7de6525b8596b096.camel@codeconstruct.com.au>
 <CACPK8XcPBCppbF8smOsO3csiWoomgheLHcudyNON3QDrwyguOw@mail.gmail.com>
Date: Wed, 05 Apr 2023 14:45:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, "Matt Johnston" <matt@codeconstruct.com.au>,
 "Vitor Soares" <ivitro@gmail.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Jack Chen" <zenghuchen@google.com>,
 "Billy Tsai" <billy_tsai@aspeedtech.com>,
 "Dylan Hung" <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v3 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_221548_083050_4F1AA5DC 
X-CRM114-Status: GOOD (  13.80  )
X-Mailman-Approved-At: Thu, 06 Apr 2023 03:13:07 -0700
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



On Wed, 5 Apr 2023, at 14:26, Joel Stanley wrote:
> On Wed, 5 Apr 2023 at 04:34, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>>
>> Hi Joel,
>>
>> > Given we have acks on the bindings, I think it's safe to send the
>> > device tree changes now so we can merge what you have in the upcoming
>> > merge window. If there's changes we can modify or revert.
>>
>> OK, I'll get those into shape.
>>
>> There is one dependency on this though, and unfortunately it requires
>> solving *two* of the known-hard problems in computer science:
>>
>> Do we start at i3c0 or i3c1?
>
> I'd vote for i3c0, like we do for ethernet, i2c, spi, etc.
>
> It is annoying that aspeed chooses to start counting at 1, but at
> least we would be consistent with other parts of the kernel.
>
> Starting at 1 reminds me of doing matlab assignments at uni, so that's
> another reason to avoid it.

I've heard rumors that Aspeed will number their devices from zero in the future :)

Andrew

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
