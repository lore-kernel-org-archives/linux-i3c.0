Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20E8CA1012
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UA2JXVRmAgtG4rKUQBxECaA25Va2PB/OF9lB9EWZ6g=; b=QORGW+x7e/e1up
	9NuEykO0m050hCM4Q/LZx2Y08yZmTQTYqcaencS9zCB4BzmUdEUNULxajgIFhvcTMV+QqMKgcACyG
	lLefa622lmHCcK5xhlsTx6N9mcVbhtNDhimEM/G+p7y8S1KLIY7wuU94kVGZy40+yJSw3RltBUzzF
	2/qdf//DBzAwWANoGthYtqFkh2YdFOY7eJS+/fSq0MiXuaRT8Uv8Ej+qKUGrZUyVkz7L0d/dCZHgq
	IYVnK7Mm/3UkBlfd8C6zVJY4cuW7SCpWdEdlmNJCi/W27HeXZxw1q6NQPpoNjcYFyqH6VVKeF4NIy
	DnvVopVmtXcv30LSEh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2M-0000000G0cO-1f0P;
	Fri, 05 Sep 2025 02:18:50 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFpc-0000000DyHQ-1u6n
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 19:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DwES
	1wrjYaHfI91Feyf2ssbbKbox3kR6dFZNwsihPIM=; b=glsruVWQ0NXAEunbgIhp
	ewUnSVdUEfF/nIifW5ym1larMzX78qtZjp8/nelGKg+PpXmP7bBMyLOQaFJJHWWn
	eY9rWz9MH0cDGlg+Vs1cd/SQ7B18oiiWAlvzAljkaWBF/9VOezA3GbqY+NItM+RG
	HRq4PDnraQET7bQE6CPSW4j2cpxXsz13147UPCM0Y/iXYapa79oBGq/Hx1WBed2M
	3/FciEC8nggumVnbFArJIggNDcYTS+/w1Q6+LmVuTTImJxUEnam0SMGc7qGABwFb
	HLy9pWvgyiiLQs80KVSJrV99A3lZ5qMIxiXlAp1ZkED1XeyVdAfu3eaiT9yiWaWB
	Hw==
Received: (qmail 3776238 invoked from network); 4 Sep 2025 21:41:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2025 21:41:11 +0200
X-UD-Smtp-Session: l3s3148p1@5xpF5/49GtQujnuV
Date: Thu, 4 Sep 2025 21:41:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N
 support
Message-ID: <aLnrV0VBVvQ-XB83@ninjato>
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLm5kbgRIcomBo6a@ninjato>
 <CA+V-a8t9VU4+Q6ofTYru2=OsrsfiSM53=rtvEzxoYmu_A0wwBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8t9VU4+Q6ofTYru2=OsrsfiSM53=rtvEzxoYmu_A0wwBg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_124117_353976_AA9CE441 
X-CRM114-Status: UNSURE (   5.18  )
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


> Yes with the P3T1085UK Arduino Shield Evaluation kit (logs can be found at [0]).

Cool. Since it reports two temperatures, it must be my modified version
of the shield :)


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
