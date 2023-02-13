Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D74C64ED6
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 10:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBL8/l5hivglr6hBTHVrd7HzmQvsjj2KQ/JDsVprHqQ=; b=vFUeBEzwO+couZ
	qEQcAaj6hqaXQap6MZsBNS1yPVc3K62sbw43DXdTmVMZSEyrc0mXJyotuRU98NfRd/Hl2TxnOuPrZ
	Q5rPlEfhx8VIwAfQ99gHFD6tcdyF8g1DfEXazd8wrIrCpM39KTmTiPlUBhiBN9E7SEkv7GZG2pjif
	efb9m8pyYu6g2nkx5Z5Z/Lastx/0TwZrhEBKSyj701+YWLWCP/C0xjH7tzx4TBw9c3WOVHMIdHvOp
	+LwsbN1i5shVE5lpgHDr0elyTF8NuJKoC4nEdoWzbrG1GGophM/u1sQPt+TC0djZCALFYr9gU2MGm
	I0Rs2VUE4ASEbxPbSutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWEz-00E8of-CA; Mon, 13 Feb 2023 10:39:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUmB-00DjeI-Jm
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 09:05:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id o18so11364310wrj.3
        for <linux-i3c@lists.infradead.org>; Mon, 13 Feb 2023 01:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9Nci8wBFuhi99Gc1NwVUN8p67Yll1xfOyVZyIiXTmM=;
        b=c6jCqyzIeeTqnOpkUl+DuqL8AIBElkbteR89Jakel9KRbmrx/Wg3h2tqF/Romqh+Wm
         2a2CLe26B9v7Ap1i4yQMjhcojGvapdrxysZDgJebigu9vKgm9kaDiNJu0lVS5ucNuuaV
         Rw6BQAMw+l6/TyIiD+Hi/TMSOTaJrvI4UZRqOdBWGf6/JKe3vV2LdZ8rJkJLTZbGGk42
         zT4aFyuQscahRdEO/Vf1saI7IasrdzVPZfP4CyW7/MhinfUWRoO84AIsShBt4DSyqNti
         yVs4LsiPmHywxkWTL6n6i9rzRxf01rGMNxDd1TxQiffM1M0B6CuIyDVQTOdd0HnoaXt1
         rF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9Nci8wBFuhi99Gc1NwVUN8p67Yll1xfOyVZyIiXTmM=;
        b=FT/tukbBBFzh5mDjIG7Kr2yjNrs2Zf5F9ka0qqH5t0GZ54J5ivO0JF3YBvbs+lNf5I
         6Kr2q58nAQW5Pv0AZdjzOWc+UPWWSupx6utbU0m1DziYgf6o08U5LvZA8p3n8WA7I6p9
         zCs3iEp/YkkbNsv6Hbkgg9OqzKL28pNxURlIhzaPzbE2nqg2JwJaaOToqV1BXZ3wb2Lq
         esIuT0E30aFnXXQyJ+aV7sF9uCX/jpxy4W9oC0gLFsDmHb5ydllUq77Ucza98KxiPmPG
         TEpZrA8NUR5v3FTrCDI1qPu7NimXy6EKUrtNQO13OMg5kCdFjYauKPXPAMKHLPULhAdC
         qPaQ==
X-Gm-Message-State: AO0yUKVEeKi5TR5bWCXo/cRBBA7NAH5+kgHyUy1skFNKvSizYAPl8vWo
	b1aFgin0Q3/vBzIwcb1Jrm/zdA==
X-Google-Smtp-Source: AK7set9J9oNwgtLShE6pSOoR54tX2fUdxaQjkklbsWgwbrEAwlSQDJi3IUpdUgLO35vSWsdrTZpfRg==
X-Received: by 2002:a5d:4c8d:0:b0:2c5:4cd0:4b86 with SMTP id z13-20020a5d4c8d000000b002c54cd04b86mr6778261wrs.68.1676279128064;
        Mon, 13 Feb 2023 01:05:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k16-20020adfe8d0000000b002c54536c662sm8637366wrn.34.2023.02.13.01.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:05:27 -0800 (PST)
Message-ID: <929a30fc-35f3-ab21-3a16-936ed69d5505@linaro.org>
Date: Mon, 13 Feb 2023 10:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] dt-bindings: Add AST2600 i3c controller binding
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <5c047dd91390b9ee4cd8bca3ff107db37a7be4ac.1676273912.git.jk@codeconstruct.com.au>
 <7c6741e1-ae41-ba20-b859-736214c680e8@linaro.org>
 <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <91e9e815bed8c2eff19dbe6b3ed36d10c6edcbfd.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_010531_704590_09C67B0A 
X-CRM114-Status: GOOD (  12.28  )
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

On 13/02/2023 09:55, Jeremy Kerr wrote:
>> 4. Where is the driver? Where is the DTS? Why do we want unused
>> binding in the kernel?
> 
> The driver is coming next, but I wanted to sort out the structure of the
> binding before committing to how the driver consumes the DT data - hence
> the RFC.

You should clearly communicate that driver is coming... Anyway binding
comes with the driver, otherwise how can we check that you actually
implemented it? Please send patches, not RFC. RFC means you are
uncertain this is even correct and you ask for generic discussion. So
generic discussion comment - implement how other recent i3c bindings are
implemented. This is basic device, there is nothing special here.

Since you did not respond to rest of comments, I assume you are going to
implement them fully - including dropping the questioned properties.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
