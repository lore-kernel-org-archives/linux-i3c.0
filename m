Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D4AC021AA
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2025 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHv9Vv50yKvXXWyTUGg/JlPZQG1X8wqjAeRG+kkmKrU=; b=qV5WTwZe37EVyu
	r+Z8e/ARH8EgM3Sj5ZQXMgCH3asePzC3fSzy77s7yfuuAuQgsCgCje4Z3jvBp/IB+HvQeGRTLEcaT
	bsjTiY9i4/bDlBkybSlnYglBu9GkQkAmGIYZ0wUrIVwoGSc9xPI2Im2tmSB1MgfqAZ8sow0uuQCLp
	A3fQerKBDNBuhoUyzjWvRqnc3vpBdN9qetOC5T5nGOQULec6jhEcWdgLHQrJXRkBsitRW11Px2jZO
	1qJBtpUXzapWsF44EWoRfaocp3k6ttQiT42QRBBCW5UaxQIq0P6ZNrSPKHG7GfE9sC/fUJRzfZ0Rq
	6sQxsw/Vwi+Aze9s87/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPsE-000000053j0-2xl5;
	Fri, 21 Feb 2025 10:03:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPZw-00000004zUy-2ver
	for linux-i3c@lists.infradead.org;
	Fri, 21 Feb 2025 09:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E43595C4C2F;
	Fri, 21 Feb 2025 09:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D194C4CED6;
	Fri, 21 Feb 2025 09:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740131055;
	bh=oGc08unFJjdspqNPw0ls9wEq6ey6P+fkD8tthUluMQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RxErVFXqII+ugR/34j5LlavZu6TDo0qG4vxbyVUD/RTVc8Cv4v6rgzAx6aT8x0XWP
	 oNPbiAJnYWoEl0173U2EMZG4+DZjUUeDl6jKfKA+IVQhK4WjemXmXTsdb7sle+xEqN
	 jiCfCFlAikceK/A2qDcyASm8tktM/9SVe9G36pX5ZbTorKX2UfTafhOWPgNQVMVZ2o
	 DNww8ujp+j6n91i2jrf49QBh6PPn8t4U76h2IHrmqpjOPWC6fmsjmUHBckWW4VV2I3
	 IVm7vDuV/bt/cD2Q67Y/6CgNO+EkTgjN2AVryTcQjs/2P02PqqdLoLfiZktXEEwuU8
	 ulH+s+Aj+IDfw==
Date: Fri, 21 Feb 2025 10:44:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: frank.li@nxp.com, miquel.raynal@bootlin.com, 
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v3 1/4] dt-bindings: i3c: silvaco: Add npcm845 compatible
 string
Message-ID: <20250221-nippy-spotted-finch-fa0a5b@krzk-bin>
References: <20250221063528.1810007-1-yschu@nuvoton.com>
 <20250221063528.1810007-2-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221063528.1810007-2-yschu@nuvoton.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014416_776406_13C1565E 
X-CRM114-Status: UNSURE (   9.41  )
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

On Fri, Feb 21, 2025 at 02:35:25PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
> 
> Nuvoton npcm845 SoC uses the same Silvico IP but an older version.
> Need to add a new compatible string to distinguish between different
> hardware versions.
> 
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
