Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE0606A323
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2026 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0m2dL4Es;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=l8mmBT7X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+54ECUXFPU1mpEAjYQ6BcUXzvJwOnOiBOssGf0FqrAI=; b=0m2dL4EsUOCXvVQGHjjgiCtu3C
	kj5QJNMoyBXOG6vC5mA6yL7z9BeJKHDCC/ollQH3p1QUa6AeQvN323d70LXz42vlTTN6uVCNvNJk0
	rxSWvBaDcKkEnCtEDH3UbqPbnBd+o2dumzBQvh4SzRELQlA61/Ohd1ceTxmXzg5LHqOSSqyd8PYKX
	Z8/Jyw7Vu9jB+jzWMbW1vLR7BvWeAnsEm3x6onOHCbqnDsVXXff/Xk26/yQOo+X35sX3DZXGgZY7H
	r6PCYCyArdU/2aal9tuC7XwG5o0Zkr4WOAUIMphSAl7etQxts/dAOSeQ/OCdRiAQ9jmeu1kFAMrVM
	2ZceiTPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAQH-00000009Uhc-0ZQR;
	Wed, 25 Nov 2026 10:40:21 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAQC-00000009Ugy-3wqn
	for linux-i3c@lists.infradead.org;
	Wed, 25 Nov 2026 10:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=34E+
	JD94HLu2tQOT261thhU4F4zT9kW4NNRZx9aDA0o=; b=l8mmBT7XZj6ypCWdj5kB
	YJ1PzztPYgyH9gCD0lPrnZSR9TY2N0DxnZwVQEwxvWa+OU8l3KYa8j9rrjISygcR
	iCMVBUhMwPef/FpHJACfPbHGhZ5naoEG6czTIL5lvLFw1GSot6pWDyFmXdQBOORQ
	Z02YeT4NtgjaZCulTGLRSEEYDd0PVfHb5DoT1FLqI/MR3C3ALb93ZQ/gL0mBYUHP
	eOfHEnxdVkqq/oWekyI5n95buYF4pzGOSL6Pgtvf2fB9EKqAnkXPVwdTYRgU8ISi
	Cyp9n/tYj2Tpl8tnarE79a/sUF1aoVWJ6Ps8BLt1uzvWD4pRsOffqJkNiMW6XZJl
	gA==
Received: (qmail 881287 invoked from network); 25 Nov 2026 11:40:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 11:40:11 +0100
X-UD-Smtp-Session: l3s3148p1@Q3OWcxdhlMAujnvc
Date: Wed, 25 Nov 2026 11:40:11 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i3c: renesas: Fix MDYAD(x) field length
Message-ID: <awa7C9LO_9Gr8htO@ninjato>
References: <20261001-divo-ssgrlpcsrc-2966-i3c_mdyad-v1-1-2250225e6d20@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261001-divo-ssgrlpcsrc-2966-i3c_mdyad-v1-1-2250225e6d20@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_024017_878606_A9625769 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 01, 2026 at 04:10:09PM +0100, Diogo Ivo wrote:
> Fix the length of the MDYAD(x) macro to be 7 bits as it represents an
> I3C address, which is 7 bits. The length of this field was confirmed on
> the documentation of the RZ/G3{E,L,S} SoCs.
> 
> Fixes: d028219a9f148 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

This is true for R-Car X5H as well. Thanks!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
