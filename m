Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003FB606A32C
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Nov 2026 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QjuZg0s0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=AYFYuvQw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YwiCCFXIfEjU4u2/TUBI1fFhiqBbR9BjaulaqnjDEgQ=; b=QjuZg0s0kXZDnM9QoSSx/51p9/
	bf+kdA4LGC4f+Y/vHmI7azM5E3OjaUqpjJ1O85J7r7U4KB+xZhobp0ToU5/LZs91zSxW3vgs3a0ij
	MKVTjQBb7Q9juAdG0S8s9Sch84290UY55AuvLr0R+wKQtubd2YwcNDdxhj2pr87H3DOH41UycTmH7
	KWLHQboxg8FYv7Kdv8uEDIEKEb1puYKZzeGKIWwmtp8gBB7NgFMkvIA9Pgh4XrqRNpBBrSW60vo4G
	odJTzZzeMVqojD3bbiHCiAtcu9ihO//OHUzmpTLa5aNb9ZrUn0EdW6EPvYuw+GjWr57TPEZ7j44WY
	QItI+DHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs5H-0000000FP8W-37sp;
	Fri, 27 Nov 2026 09:17:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWs5F-0000000FP7l-0zJd
	for linux-i3c@lists.infradead.org;
	Fri, 27 Nov 2026 09:17:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so24376655e9.2
        for <linux-i3c@lists.infradead.org>; Fri, 27 Nov 2026 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771051; x=1796375851; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=AYFYuvQw3QDPDnBJ/57aPahpg6qUkgYr6rFZcFGzRSYnrLjnltj6D90chUjpTVuDxd
         yoFGtlnZdBLb9LP6BqkvK53H4647MSyRtFttB1rdTk+Yp06hBBa8uoOE1fpHkJUu6vzL
         DqCZz/TFmUD28Na1SSIwB5nLwXLxOC2aNyx2lLuhSxfAB+lkwq+pVyQurBOdCROWuAgB
         aezYI2mDQ5zBFKq+0K6GGEEbgl/2BKqqhlOmzfuqFOwjWYa+wn3Qio/8O7dK+G2x4WBy
         GFS1okyMSnSozdRn/goknTIukRMf0bHCwUfNMLXMc64bYjAit1ap4+6NyPBM3efDzf53
         eLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771051; x=1796375851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=OohA+t7kX8Howi9AJC/cqQLzwFbTPvFbse/USQOTYeGjr+WuoJbb6wFJBRRQIYxKgs
         vcvLbupRdH0kNdoW1SkEOOvU2mx4m+iQkB93MzoKbFgsSAIfCHVxhyzTjduU6Qk1CLtQ
         I7Lvzpv41BYmq8TE+JpshQAaKnYuIHRAx4spXOyy933c4nbY9c/Bj5oLP3gGcCJhODKn
         30s3ePXaxvkD81ZwNG2WS7uQV1j35Gsx8BGCKD269Smb4IDjXJui1aZhAR3ilK6vCupx
         TelLt/17uiJkNey2LqoFlxbcj1yUKlUHAewkIvkCAsGhfNsZw5CY1+uZ93Z/qVaP/xO8
         AzyQ==
X-Gm-Message-State: APuU4Z8KnB1gLcl7q7jOSy4FBbeOuw6Yqq2hWd4CV9LHmfod9uDy7V5J
	wZznlsvshS4qZtUAK880AN2AeVmBoLVGs4ZZ+6RPfqq3cxRFqJb9sVCBO0ETtgOA7Nw=
X-Gm-Gg: AZFdTZcSVhXlF8Asi/lPLYThYynorV5Kr4aS3CZuA/kc67vW25qfE0GRV2JDFNm5rvu
	WmGJ+pem10gvqjgi5F5EDA8ocrHuV1JiF7bVp5ig9XWIcMxygDrhRvA9ieBbTybDGvLXshR5peQ
	4s9YidXu81ivwMZSaYW1fz9VQVopuPYMJp4Z+PsT8X7pi7ItzaCWBn3t7ze9RBG51qr7Ppqoqxn
	nlWvGpfgPtrf/D7a7UnKc16eaxAqseZenZsiAFqWzQy21F2yjxMae3a+whLUU6ye8q0Yh5iRIhs
	H1wdwUJAg6WQ9mTq77GKLidHHkWS2K82YPEf5RUR3X2lA/hj+TtZ/5nGN6KmHg4G77hcDllW4Z0
	rb1LpQKsYSwOcb8t1+NyNBPdjx/pdKF4wY9RA7BuACgaehypn1Q2rDsorqnbyCIVq0eyE0sZ/vW
	/Q0vv48RBvIm3bauyiQolhul/ublJnsDXmVgkIHjiqRk605b4IAQ5KiqJ/9eK9sXmGIvUj0iDGK
	4z3FsXgMQ4tHXJppD+VeBDM4iGvyO54Wk6+j7/V3/fVHfnQHIYi+Iyjvcpf9Kj33K3DeIja2A8V
	0K5gxQ5fMndXTij7RzXsz05Gkpcp1uT5VKOW
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr438432725e9.9.1795771051464;
        Fri, 27 Nov 2026 01:17:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm896151645e9.0.2026.11.27.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:30 -0800 (PST)
Message-ID: <5c05644b-fcf2-41e7-a012-338ce7eec8d2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:29 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] i3c: renesas: Drop comma after OF match table
 sentinel
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_011733_290009_F17A273F 
X-CRM114-Status: UNSURE (   4.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 13:35, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> Reviewed-by: Frank Li<Frank.Li@nxp.com>
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
