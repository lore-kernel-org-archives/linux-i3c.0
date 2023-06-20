Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDCDEB64DC
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Jun 2023 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkqMDKhvzhUQbR484K49lNja79JVn8eehtbK3Fv4QvA=; b=PfMv3EQQe5STP0
	06CR8p8R9FxTHDRbax8n8UZC45KPYbt9zwlR3fzO7cX6+NnP5jCJDqIuXQZrpeJVBSuEYpGkPAW4W
	vG6NsyLHkbW8zlF/YaHYHiAmGod/9Lbm7MJUo0CzD/2KHeeuoL+Q0G5K3Y5tVptplEBauv8F3zBXc
	QqgcH8IN1pg7HuavyWh4Zh5LQno7YbficAqJY3TdeWvuMneEPjiBLgaTr6EYJsO5pRuNBhQ8Mb68G
	7iUGSQljSby58b5ibEZseTacXmiNllk1vHZjei4lGMNNApqxq7TGhWYj4ah9sd9hmK9JRWgZxyh7R
	uGo9I0VVsr3guP4ScE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBcfo-00BZhE-37;
	Tue, 20 Jun 2023 14:49:36 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBcfm-00BZgh-0e
	for linux-i3c@lists.infradead.org;
	Tue, 20 Jun 2023 14:49:36 +0000
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-77e3ba2fbbfso107887439f.1
        for <linux-i3c@lists.infradead.org>; Tue, 20 Jun 2023 07:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687272571; x=1689864571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfGW8gXxXc4xOldKhUQqmMtTa1hUcNXAiWfRoW8/qv8=;
        b=COKxB1jogohFToP3IrFxocrboPg7wvW56lC2jzLqr2HvbfIQR/KNFit0Et0R8PZSGs
         Mt+dvBtgUuw1Uu2TuHEkU2OW0dS9a/k4GuijJ1vemVe93h3kZsusbLs9224vJQY4SfFO
         JTaYBW1A2fqzEiyW5XiSMruMnaK17N6J2pRQTvNFGubC1YvtvUGTGjXkkSg+Q7EkmXqi
         EzDpZgpT+2m2XKhFRZPFuBAGtRMnih9f9eoVt07dwEq+A/XDUFJQM+8/koErnceiW9U7
         klOO+18XNTzDYO2RBpFq1QTzAP5LnsTRmT3igWb+Z+G2fOnpRdi2En3PuVUsNw30Bde4
         CjAw==
X-Gm-Message-State: AC+VfDx0nv+eAqTK8RJQTKdNsvgM7AKtGYkPMFYEnRBwUPsx86NWjSyE
	QwlsqmDk01zlfC0gQjxJig==
X-Google-Smtp-Source: ACHHUZ6HuhVgOMehTrCrc0BgkQnyUephcmWsY/z8kAL7h2yHvSPpPgz4eu3wa/QgAeDXBeMlwifExw==
X-Received: by 2002:a5d:91d6:0:b0:77a:c741:b749 with SMTP id k22-20020a5d91d6000000b0077ac741b749mr11549610ior.1.1687272571543;
        Tue, 20 Jun 2023 07:49:31 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c6-20020a02a406000000b004166c24e30dsm693185jal.32.2023.06.20.07.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 07:49:30 -0700 (PDT)
Received: (nullmailer pid 3574420 invoked by uid 1000);
	Tue, 20 Jun 2023 14:49:29 -0000
Date: Tue, 20 Jun 2023 08:49:29 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Conor Culhane <conor.culhane@silvaco.com>
Subject: Re: [PATCH] dt-bindings: i3c: silvaco,i3c-master: drop unneeded
 quotes
Message-ID: <168727256801.3574342.4318996941129630484.robh@kernel.org>
References: <20230609140735.64855-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230609140735.64855-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_074934_263457_3F3B53CF 
X-CRM114-Status: UNSURE (   9.77  )
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


On Fri, 09 Jun 2023 16:07:35 +0200, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
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
