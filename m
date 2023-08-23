Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727BBEE4993
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Aug 2023 13:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXf4uq9s0zpZlcnEr0vRdisKxyPEJ83QiMCAgfudYH0=; b=zOqHwm6klb2auR
	JEnEmBVmiMgXlU4eGYhochDUC2tZXBzMta+Y24DeDxuchyr5lLACu7ACiWAm45XXXFWzOw/pbGYVv
	GrH3vthArGHpe3cs/k06kvO0M537QQjWR+0l6mgi6EVnvlCfCDNOs+DlJLL3BfHvOJx/Z68zqpAmj
	O74dV4Ea5GHT1pd/wXgFQkf7yDAwem7Q5FFDMACgTvJiLsrJ4qKAO3KxwGcvs79GdmPuF1h98rCcc
	7aEiqJMAt1M3uZtxhCw5oSF9yP0s1i8cV+saHTfnUpwoCpOaLvh2XEms0oqmdj0TzC+0Ik75P+jGQ
	qli3x6sRHBCVR8uRdagQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnmO-000faW-2R;
	Wed, 23 Aug 2023 13:20:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnmM-000fZj-0S
	for linux-i3c@lists.infradead.org;
	Wed, 23 Aug 2023 13:20:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 998736628D;
	Wed, 23 Aug 2023 13:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEB5C433C8;
	Wed, 23 Aug 2023 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692796808;
	bh=f0rbuJKzxJUmE0jONDg4fsgdN5yoz/A4HK/gD16iZJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeTlxarsXj63zuQXvhKyHBN3p+r/9c2+xWXOUG678UNedAmUsTY0h/UKiCrlstEvr
	 uEgrnaLYLiVsS0N5DGkVwAy9CkvhRcO6GFXlyuWb2DYRVo+zg9LSCDOjD2zkUpQUe+
	 UsBkv6P/3HYyK/4ZuW0xVc+1yMauNjcNosZ3//e91rBst3Kn2XXlEQtwqxwstdG5g5
	 eXByjRwRdwNE4z3D0ZssIP2i0HTTffbe8eHTMBe7B8XZ5rukgxFIwyT3P3G+irHCVg
	 ixFl/Oi7eKrSFjP1YQzTzP6avt/+vH/BgwzklyVx+t8exXy9G7dINJeR39+HhAY6rI
	 yINPtptmANx9Q==
Received: (nullmailer pid 2204416 invoked by uid 1000);
	Wed, 23 Aug 2023 13:20:06 -0000
Date: Wed, 23 Aug 2023 08:20:06 -0500
From: Rob Herring <robh@kernel.org>
To: Aniket <aniketmaurya@google.com>
Cc: manugautam@google.com, linux-i3c@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, joychakr@google.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i3c: Fix description for assigned-address
Message-ID: <169279680573.2204361.10063597911204356200.robh@kernel.org>
References: <20230822051209.2837818-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822051209.2837818-1-aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_062010_224550_9482D55D 
X-CRM114-Status: GOOD (  10.93  )
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


On Tue, 22 Aug 2023 05:12:09 +0000, Aniket wrote:
> assigned-address is a valid property for I3C device with or without
> static address. Fix the description and an example for the same.
> 
> Signed-off-by: Aniket <aniketmaurya@google.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.yaml | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
