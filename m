Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9198C7EE29
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Jun 2023 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMNiAlTplC1ynPavMQ7k41Ho8KoRquljvtm1MLZz0vQ=; b=UOj2NtYpdRZdOR
	jwlynIDTFWioaElXaveDTkPZZyaGYSYjY+yhHZL7w992G7CIjfzAaRiFw/hJajdnIhq2v0HIkIbMI
	DWRmaK7Tm8aF/zWH29Be3n0WUPDntq3H5UJ/Obcu8TAAq66A4v96qKSmaVLtfluuZV+nX80iVasSd
	5XjoT7LC/tFc/Yt/78UYrT71jP25XrnfqMW/XfiLtD2xH6mcz+uB8Uw0c5YqDBoo/XVobxXo2L4U5
	gB9riaTLTTmVd722kKPEF9Tw5NvR/ZXeSILi65Kn5PHfYc1tqJjDljkHZnKop+JpZExt1J4z6G8ZM
	XDAGtjF3EIFMKr0Cs1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7kN2-00EPf5-05;
	Fri, 09 Jun 2023 22:14:12 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7kMz-00EPdw-0R
	for linux-i3c@lists.infradead.org;
	Fri, 09 Jun 2023 22:14:10 +0000
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-33c1e7743b7so9899015ab.1
        for <linux-i3c@lists.infradead.org>; Fri, 09 Jun 2023 15:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686348846; x=1688940846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t6u+Mrz/1dBbbMkBNyrqyoA02iIWmNZLtRYGVEXPGQ=;
        b=SZX/E6bAc+VhZ1C6cigL+QnKNhvA1+VlGf4qlr3hBZRZzEqnXoJeqOr/786Ae/Mqir
         VMdgHqUE73/txXWWQK+TEl/ICAJG1inIaZ/oYAAVDdcWNkENBRtP5684hXEdebrr7cAS
         1I3cAnToxQB/UObxDEFk0uQZFXBoyogHPVl11LZISeQf9glNi1kTQ25XV4AvRdoNkDOH
         8cWQa8eOr8n5l+eIkkkdyiJzz/BZlgbzhwrxkNO9Y26Xh7DgMJkhQ63J7tZ3E2h+/U94
         GlErrKXxgXkYKfEULM+i/cvWvuuT0RqOVdHQPYSpeAoprXRS8/CPVsRZV/YfY5jJaFw3
         qQdQ==
X-Gm-Message-State: AC+VfDwYbbne6w0IsPO8wv7f6DlCp6IdMAJAKxiVKzQC7317QtnW7FDf
	8CYIefoddDNdpoUM78vXLkbXPbGZLw==
X-Google-Smtp-Source: ACHHUZ7spV28QOx9P+mLMSMdbxJijLJ+sPQyGMPcKYjCMQj+2YQfFp/o0NoxbuCC5Gm3FxS/L55XwA==
X-Received: by 2002:a92:c52d:0:b0:335:25e7:1897 with SMTP id m13-20020a92c52d000000b0033525e71897mr2493119ili.32.1686348846262;
        Fri, 09 Jun 2023 15:14:06 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ep27-20020a0566384e1b00b0041855b3a685sm1177478jab.150.2023.06.09.15.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 15:14:05 -0700 (PDT)
Received: (nullmailer pid 2555446 invoked by uid 1000);
	Fri, 09 Jun 2023 22:14:03 -0000
Date: Fri, 9 Jun 2023 16:14:03 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i3c: silvaco,i3c-master: fix missing schema
 restriction
Message-ID: <168634884066.2555331.39755837725706368.robh@kernel.org>
References: <20230609141107.66128-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230609141107.66128-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_151409_179645_3DF1C302 
X-CRM114-Status: GOOD (  10.86  )
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


On Fri, 09 Jun 2023 16:11:07 +0200, Krzysztof Kozlowski wrote:
> Each device schema must end with unevaluatedProperties: false, if it
> references other common schema.  Otherwise it would allow any properties
> to be listed.
> 
> Fixes: b8b0446f1f1a ("dt-bindings: i3c: Describe Silvaco master binding")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
