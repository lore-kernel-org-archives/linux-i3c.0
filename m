Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4648CC44506
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRPW8Jh7cPJyUdPcXDuPMaTOxvVrpXNlhlIcrETdjXM=; b=jRpVQhICeHdwWA
	FxW4qVpSe3MiDa9dpbamPi8ws5VdRRofCybPTeFSmBuUCyyE/SJgAQkEZwJa0e8EmHax9lNm32nBW
	2nb3FKTzZaA7pkd+BKxXdTkP5hSATgxNlN3bBuQdfvBwKgVxxF9UTmkiylZZXd7vqv+dwY+PdCVi0
	goPNyPxoS8MOPSuUYhYF+e0Lkuo48aN3EcFCU4uJ9AmNIr0jwEtYcJ7sfYf/fYcg/88wiRfqk0Nla
	cDOOgCVwEUhPNpBBaXbbosakbI65xOf/4BvYEXqhC28kBj7Qjl947nILhtii8WgnCeKpuLizmgFmW
	dxvbMIBHa9bUS+EoJ1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn0A-00000002CXA-3hQV;
	Thu, 09 Jul 2026 11:33:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn04-00000002CHA-2f45
	for linux-i3c@bombadil.infradead.org;
	Thu, 09 Jul 2026 11:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CLjzyOv/WTLBRnX5mDjhunmkUjnf60dz6rJau52ia58=; b=ZVHRtQlQZ3xQim8KuCKZ1MzvpM
	3EbO8Xd0Wvu2dlgE2QeNysIDLAcGguhPpFnPyiRewolcebAoSO/kKvcLkioGsadyc94rsqgNzc4L5
	I1p7Gcp90MpMkG59Eu2zVY73eUrTuma4+h0KmnLtgXz4UUl5MtlkFq0xaeLdq1eC/9WrLU+jiD6ix
	ovOu0tRQtxRXBr1EZRMwN3xMiZet+/Z3EmDncfMzVH7+d7fsxMWBCJLsceDuakbUlL188YKm1y6OH
	ABPCcPd9TdTG/GI2yG0oeaxrUS2wxPRP+e7QcXnmowMLkStHuPIpwNxi6SGWRrzQ3fFmMAe6WXUwS
	2coKXovw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmzx-000000098zy-1rQI
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 11:33:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47362928f65so694006f8f.2
        for <linux-i3c@lists.infradead.org>; Thu, 09 Jul 2026 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783596775; x=1784201575; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CLjzyOv/WTLBRnX5mDjhunmkUjnf60dz6rJau52ia58=;
        b=MKX3qKPJEBFXLB3zXrqepRC3UB3C1BxIFWBdI/s1OLPHeFUBIkxmVn/S7uQZNDK7LC
         E6DTAbdKjK1kudPIPNkBcrD1K9el6df9P26ImaWWN52AyAoCNMGdtsidJdHZgq/Spe9/
         gnM04ktiYocXDyf3xvS/yedpM9M2oXFOauq1SaLGaGyoP+t3gQv43RWqmF0fXzZTLP+r
         TGcdAZmNDSYQq+ju2q5tOH+aKeJNHWSYUbH+XTDgE2IOilanvxkaB1MllO9iT9Olu3Om
         oYVbjqyrHu4cfGB3YviN8ZW1b6YIAv56SUMliBqR1KnAjwIXM7jpdmBLUOGVucUhd12W
         4ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596775; x=1784201575;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLjzyOv/WTLBRnX5mDjhunmkUjnf60dz6rJau52ia58=;
        b=cMeE/zhcundM06RKmb8B5Bf0W5qhgcKid1yacGcddrZGUCHlZC3uVoEb8j+M27xKIc
         1MzX7ModGnQkJuauaPgAHlZjpv+28ukGK8IOo2vtBFBQ+ofHVBKPAaeg0ARTBhQgz90k
         Tydbo//pILk6pB2eTX0qzquKwHHm787cu4DN0N1mLkTYeu7Fd1jQZF8C3kPlBau0J8R5
         Xid4we95p+9EyD3O+0BAsznV6MfcQ0tiav9rNQKdMWkBrW5+1//Rvl1hadjXSdD4HtuQ
         pFUVeHSAX6EIwPnpyu/2xvKoEJB0YYvUw/ZybNVaSe4cL8RPqetV6EmrrOwgGrqBr1yv
         wGag==
X-Forwarded-Encrypted: i=1; AHgh+RquA2VgBlwrSQ0P4vuhiqBEUMOZjE9jPMiiZ6A98vNMIj9IjE81RL8zk3eum4pJHG2TEkySuCvPGIg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz24jIDrYBduIBg71tDTo1xMHLTbgCIFd8TnufiACGVLY7/BgQX
	UTkaWk2UBvZ3X6H30zrYMG5MAzObDuj4lkQr6X7wKDJJFzFXm6Oe3rXj9jBG44XGwhk=
X-Gm-Gg: AfdE7cl2D9qGDxakYzEFbEb1VyD5f8OunMX/eub5zEzem85oyiiTEp73PT8eLGr3a+a
	0Zxx+pKgLexiV0n6DAm4ggbF1TsCvSdBYX1hKEjWZiwOLzoRNUoOP+jvUfKII/HqJYpCLnXkROl
	ZMh0XjmXl1iUI4XV+nisKd0mgIxeL5MUf8En1Ym870vhFSvFholvfQTm7erRKKTvowyL7PuJyKu
	Crc4E9yM+96g7M9o9sZ7JQyH6XixQ89sJkpNvNds5QEEethT17ndXfY8HSfA8ntEvBGOD+J48b2
	QXMOsgRTLxyvHaiUTqFv8B9H6AwPapDcA7GohZfieIQS/tlZNughV8E1ImszxoiaA0dORVyVETa
	bKTkr3wuiVBM5+nFhqJ3FtNcYe2l4rb6nupEoHVdgUOkx30E87ANaVJWrpCb/i7ID/qg1+9+JPb
	WudHmt2eh2ulWFrNRoYa3akzD9jJNUrwpOItSy2NYH1H6Gcy/WL1BP
X-Received: by 2002:adf:e195:0:b0:47d:eee8:ec40 with SMTP id ffacd0b85a97d-47df0797e7fmr7287312f8f.38.1783596774909;
        Thu, 09 Jul 2026 04:32:54 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm51491575f8f.3.2026.07.09.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:32:54 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 5/5] i3c: master: Add optional_bytes for
 variable-length GET CCC validation
From: Alexandre Mergnat <amergnat@baylibre.com>
To: tze.yee.ng@altera.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jorge Marques <jorge.marques@analog.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, 
 Felix Gu <ustc.gu@gmail.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
In-Reply-To: <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <2e07dc944eab1c4358be1da87fa5000e711ac8bd.1783493868.git.tze.yee.ng@altera.com>
Date: Thu, 09 Jul 2026 13:32:44 +0200
Message-Id: <178359676411.1767060.12087768870697006429.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=419; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=lvRoX7NF7koqKSVMWIj1y8gTZBU4/f7JqGnAfGc3AXE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqT4bjluy7zrbpNSclHQ8EeuHb7lIqwFLY+2OQL
 p7mhmQgtriJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCak+G4wAKCRArRkmdfjHU
 RTpYD/0X1X+hSUbcA7uP4N9hoS+E+Xq0BvJeA8eUc0sZaGfgUreShrBwNL0ypoYqbiVlDQ40m1s
 q1p9XAmjHaPZZaA5O7SYeT3i91SRyAmETeelF2NuQ1uv5OOefSIhSvSQHGmZRaIjN08EexAe4sn
 YiSTEYg8UMZHGwAQ5TFPSY2c8iwdpmx8fdgLTzWfqIXiAR9IgY39Iw2UdGGPxHKSlwMHnZEdO0s
 EjNI/3xiz5zzUUS9ao3nFQ59zEFUq5RAL5xFQ5uhq7Y08OiIr+9K3F6F0d7JGHCkca8SdkqRLJq
 oRs9ZKdWRXOsA/95u42z+84L1YMMTf8vWGtZ+pUoOYEBbPcbFUt+eM0Dn4y7aZHU6L0y71qjog5
 iom/UaCK/awELvrQuqbE06LCcsNYBRU5MLwFjusZagYQhDcSE5RHf7+zrjZF9G21S3HFCYZ93Ek
 gfZhFcRG57xq5d9QQDlmKzjpWFMXpCCYy+R1VsrCS6C1RrmdeJMjVrMUI2tPVoYzGul+w8gD9ld
 byKUACRjbuv70DuZU9V9HD9wbIgNWCqsg+7c504pmLTx8B8L8qaFTzfO65fv8Lw2tDbw0c0MGa8
 dePEULSAhsn9+7bH0d3001RlmO57outneVIpswo3jds8TtddxB/2INOjr/WwxZW5D2ZRZTFfPRt
 sOi7v6P0RP428yw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123257_627543_6A6D5124 
X-CRM114-Status: UNSURE (   6.00  )
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

On Wed, 08 Jul 2026 00:17:41 -0700, tze.yee.ng@altera.com <tze.yee.ng@altera.com> wrote:
> Add optional_bytes to struct i3c_ccc_cmd_payload so callers describe
> variable-length GET CCC responses. GETMRL and GETMXDS set optional_bytes
> at the call site. Extend i3c_ccc_validate_payload_len() to honour it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
