Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DFEC677F1
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZ8kRiCWHPU0L5cc2KK3ireBqsoEgoooFxizRPGn4Dc=; b=txgeEVCyqYa0nH
	q7dGEV9HK4tIMv2lmCBQj3fTBV2CaD1KLrdwDLnA4aRrQNT6CRLnwSzoLxJnmlrbmWUHY0rwpLfxn
	bE50nPU00auD+q/KyHuNKXEYQno0MfpmCY9wp/mxkjdPq09y5YiwyXF2IDph5NULdt0/OpENvADp+
	dwYrH+UoLryQxna2xF4Sp+HopBb4FVJWGR2ogRPp3Vtdikz58u7015d7fi4lbX/eqiR5D+e9PiN1S
	tG58Pgb1gtMc4tN1KD4hXppcJrvQMDnJwbQ14tKEUb5HQXBXg3ftOwgJKszUzOmWp2x5Ki2SNkyer
	FXAeKbiTMlmAj5lIBl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSa7N-0099Ix-6J; Thu, 16 Feb 2023 08:59:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZYr-008zoc-QH
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 08:24:15 +0000
Received: by mail-ed1-x52d.google.com with SMTP id v13so1621705eda.11
        for <linux-i3c@lists.infradead.org>; Thu, 16 Feb 2023 00:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3luqpqMCqAArv+ATLddgvJho7XZ+hO7X+w3N9TqYySA=;
        b=ZTxnV/pt75FixULSRW+glSd/hEjCXD8kSVS1r8oK9IOroR7sEG8JT29KIQj6OuayTg
         82J9W6gT48Lvgr6AcrWkoyiTpKMuj4o4/UdxGuUiJYGdaxYeWV9T/BOUek5StlA8gCnx
         +506CByaxqr2qgUUmIYMd6JqI1TtLJwWmCo6E4QOJvlnhPCuaRtZ88PHpIA9+MP3dxt+
         haxe9mhuH5Il+VJnO3nDaXdbplYlFej6e5+KcqoBoFzATDSlqUG2I4bPwkJsvzkGq3hy
         Mjwnz0aw/Nn71zBBBxYBF0qUOA7vVy1oOoUcDGgG73EPIZEhJ8XiDK5pfrgZaITZmAoh
         o2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3luqpqMCqAArv+ATLddgvJho7XZ+hO7X+w3N9TqYySA=;
        b=URGD1+k/r+TDZp36IxS1RoMP8i8hn7d18ofm11IQjgFud9jYkcgFDJaFU0UYjMA1Bv
         bJHtNk9jKaI3fRj7c90PgrGrTLZZQmC91DHoouuG3o4hxpoegFhddIGuRYCqaJNMOhsi
         hxjNhlGS+N+WnZiRloFkwl2suTYUSPh66XhGXXJ3kLcS4Ru45uf4EAayL/H7Leaxxu94
         UAx/V9m7MvePHRDSltqzNOCcSSeMNdnqtelL2MLhGW6Ft/K9Dl3FKRTpekWviYM4BbIY
         Tdpgp+8MmcY5tWM5lJs/V3gtaD1Xt3m2Za53dson0ISneJlrBFWse12yYZCZ58Ccnu//
         5A7A==
X-Gm-Message-State: AO0yUKUVP4mIXzw7wU300A94BZr9iOPC1K4jWeD0TxYlUHvvZUMdP9Hm
	u0VsJjpMeNHYIL//OckPVyG3g3/j2WmZyXyY
X-Google-Smtp-Source: AK7set8ht+d14A7kUkpoXY1VjY6KH78thAEOM9Wve8zpWCCCgGBjK9Fie6hCWP6IGMCq8uOAAoLarw==
X-Received: by 2002:a05:6402:885:b0:4ac:b97f:214c with SMTP id e5-20020a056402088500b004acb97f214cmr4664837edy.2.1676535851432;
        Thu, 16 Feb 2023 00:24:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q2-20020a50aa82000000b004ab4c28a967sm476133edc.44.2023.02.16.00.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:24:11 -0800 (PST)
Message-ID: <03fe68be-ca9f-967c-b5ef-0599177caf90@linaro.org>
Date: Thu, 16 Feb 2023 09:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] dt-bindings: i3c: Add AST2600 i3c controller
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vitor Soares <ivitro@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <cover.1676532146.git.jk@codeconstruct.com.au>
 <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_002413_914683_156D5506 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 16 Feb 2023 00:59:51 -0800
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

On 16/02/2023 08:41, Jeremy Kerr wrote:
> Add a devicetree binding for the ast2600 i3c controller hardware. This
> is heavily based on the designware i3c core, plus a reset facility
> and two platform-specific properties:
> 
>  - sda-pullup-ohms: to specify the value of the configurable pullup
>    resistors on the SDA line
> 
>  - aspeed,global-regs: to reference the (ast2600-specific) i3c global
>    register block, and the device index to use within it.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
