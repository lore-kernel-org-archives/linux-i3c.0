Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97844C433F5
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Apr 2022 07:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wm9C3vlOU2586JH7NhlDnfRv6ZMEhoDOF/uP0fv4LaU=; b=llAC22qEoUrajW
	1FsJ9oQv+/whGt17ykwcjWxJrJ20tZRO96RByNEeG6E2aC4fH+6Me5/JJAnGkC4R34eQ+pDApxdJr
	JopbvJIQLNc0l+GedAHv7x+Dwq70lTHBfJE+QBmJQ8bKAlkX5bjVarEmLir7soPdD/DMvnA4gAgXL
	IsHJoEhWgP5r+3JzUeoIqRsfbdt1l4xVCRk4BZ62OMHOf+AWFE0qHgYXF+EsLz+M3yDY5djxPLdi+
	rfqrFgr1GARoR8oQhhuNCBLJV3Tw7qux/13cN4dNKj+95AghWZcISdd+ZNSl6Ui5cLcVUtko+OcSK
	hf/KMSeWeCX/Szg82IIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcS1-000OTO-MW; Wed, 27 Apr 2022 07:51:05 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niKlu-004rGH-LH
 for linux-i3c@lists.infradead.org; Sat, 23 Apr 2022 18:46:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id f17so14063400edt.4
 for <linux-i3c@lists.infradead.org>; Sat, 23 Apr 2022 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BE7waq8Lk7dT8Foyqp5jRqicX/Rtb6ukKEBR4TI5e00=;
 b=Lrhdgx3QfeUC8LXlshbtxKk+TlSDeeYoNDuAY4AnVS59QXMWblEhQ3vkvlnb6pe5TT
 /AzGkGLSJpsm2hyCR5win9QCWWeZZ7G/bjfDJUrHDjvt9TQhMLoXiqLvzQj1oajMlGwn
 dLLx2uUltxPJwwpfT2ovKB6XXxv1vbiyjVrhbiGFPFX/Zegx6SMx/4i3DqHbSfzE8LLr
 3uPLNU1PiygWa+Sc+E8VtpThpx0aBGO2wsbJrVvkebWqExKymQJ5LlPdU9LVGyvHEIq+
 uUyCNErr8iqZTAcQw5Gap+iDNNwg7a30dql35PsRAiBlghr8wh2B0uYctMph5UgZMiH3
 IDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BE7waq8Lk7dT8Foyqp5jRqicX/Rtb6ukKEBR4TI5e00=;
 b=QHd/CN9/AKRA9Yo3IOaPtCYHYfag0yjvshIRvCu5IO12eNIeqq8JGjtnI5pPRGXw+/
 Z/0gW8HWUTsW94qTmdILnIMVghI8tI4z4Lfm0HgxW8xtukKSL0uUXGwm4f+XCi0m3lFR
 8ojcH0GL5PwRRIAGiXwVjwnDkPkqXN82vQTxF+J1JUd467taGSwBMywWaZv6o7tS2KFf
 J3nqWQQI0pCIfkdRsVnnXMzvrn1CoDAIXfDNa0IwqCqymoXZI4QiUU9nnGyx+uP1E+EB
 GhDE3MfVcf+v11MI+VYjD3vgaqN48U6BT5AU2BFTnDMjfslpGi7VTwtpIf28Br1zZlto
 p+jg==
X-Gm-Message-State: AOAM531ueLDcce/dEC6peEIe/HoGuFzPl2my5rfKNOQCa7SPZh9c17RX
 fkePqnaFTTSrPcFRPkZmGbQpPw==
X-Google-Smtp-Source: ABdhPJwk2byNhB0fTOgcdb8QQvPrbR6yeB5tkaXKq7xNNRMT8ane5xnfdx9eIMjhjkhw0ZQH1cqIXw==
X-Received: by 2002:aa7:d916:0:b0:425:d75f:ae68 with SMTP id
 a22-20020aa7d916000000b00425d75fae68mr2132990edr.270.1650739576064; 
 Sat, 23 Apr 2022 11:46:16 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 q6-20020a17090622c600b006f3876cd90csm96634eja.198.2022.04.23.11.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 11:46:15 -0700 (PDT)
Message-ID: <bf6d4735-8733-7ff8-e1d8-64e259fedb2c@linaro.org>
Date: Sat, 23 Apr 2022 20:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: i3c: Convert snps, dw-i3c-master to DT schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Vitor Soares <vitor.soares@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220422192236.2594577-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422192236.2594577-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_114618_752571_0E8C29B8 
X-CRM114-Status: UNSURE (   5.30  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 27 Apr 2022 00:51:04 -0700
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

On 22/04/2022 21:22, Rob Herring wrote:
> Convert the Synopsys Designware I3C master to DT schema format.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
