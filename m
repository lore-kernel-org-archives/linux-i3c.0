Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C28C87FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOvQqFOla/3Aj9ASPl/MDtkshzAZYo452cW5splt3nY=; b=gOkKev5aXLykJV
	L66+/GM/PB8WpEo0hMtAjkAd6tEMRv579Ay8K6h84I+ARjmUBHBufIvyBhqy5+F5FlRRE4OQwjDkf
	2T6KE5OTtuAt5OzHwIhB5DNu3svebPg5hEvJB170tLC4S+7/wiEofDc+alSRscLLpzeXgHiG1WvFA
	STy4Y+bEzXbdb6KNO9ztHcCgDAaGwsLxKG0dz99utqahvxkajaMHo4v8RPaRSKjB2fzCXxqWdzeFL
	GZcqELxOje5GYdWoW1IH9gUuQ8ArkKQ5IkRidL7GJ8OPYt+6lIxSF7YHWrYq2gWbAGA68qws6ijGc
	kKqh7PanFtr4zTlYNldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPn-00000002cWt-3qQN;
	Wed, 30 Jul 2025 23:40:55 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPl-00000002cVT-3Lbs
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 23:40:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1410F43287;
	Wed, 30 Jul 2025 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753918852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QqnwsuSVW+Zc6odCI1ubD6YTo4yiAv9G49pZqEdYqro=;
	b=Ow5qj7gpCXgfzWi+zE2mEyfAc8GzysbWeACMEqdMthjF77PiQp55qhScEROQwA/Setn8qJ
	nPK5QTCuQQCQzSdpfHmxz4lTI/sjrOrYYNI/w0Ysdhc93ZW/ZHgN+o0eIWO21R/PD3PxUY
	NSzaDWrQ4K4Odx2HFaX1Damz07U6tNmDTatstkoY4S2Jzd/w0lefcJehhKbXyFazCHRWa9
	6akoRD9+16kt/YPOefIOFAlSQ7y3JXAQ9jJkU1zwjivBjUGJFkUgbSCdDcoj4sHgGY035Q
	reYYfMGDs0DZSZaTcrIraAJYartPIlmjSX0BUnoIfdmbXdpqmctnN9sfnq5TBg==
Date: Thu, 31 Jul 2025 01:40:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org, linux-i3c@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH v5 0/4] i3c: add support for the Renesas controller
Message-ID: <175391871299.1768453.15692596004990762400.b4-ty@bootlin.com>
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelledvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemudgvfeefmehfledvleemhegvsgekmeduudegfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifshgrodhrvghnvghsrghssehsr
 ghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehguhhsthgrvhhorghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_164053_987088_2D420F51 
X-CRM114-Status: UNSURE (   8.45  )
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

On Thu, 24 Jul 2025 11:41:39 +0200, Wolfram Sang wrote:
> Detailed changes since v4 are described in the individual patches. A
> branch with enablement patches for RZ/G3S+G3E can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c
> 
> Old coverletter:
> 
> [...]

Applied, thanks!

[1/4] i3c: Standardize defines for specification parameters
      https://git.kernel.org/abelloni/c/9c0609d685b2
[2/4] i3c: Add more parameters for controllers to the header
      https://git.kernel.org/abelloni/c/8acf1f3bae1e
[3/4] dt-bindings: i3c: Add Renesas I3C controller
      https://git.kernel.org/abelloni/c/94e611b5b9ef
[4/4] i3c: master: Add basic driver for the Renesas I3C controller
      https://git.kernel.org/abelloni/c/d028219a9f14

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
