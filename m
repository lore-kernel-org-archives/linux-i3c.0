Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3EEC43458
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQ39JFL7n92GFqJGWMP7CqqteF/Ds9iQyYMNtLo7ZK0=; b=JuWB0UtjlSQ6r0an0WtIgmIMsd
	GVvzkH1S+TuddGOcLCaj+M6rqPBTxMJJh0b3y8Jzz1cIlJSuksJioQV4Rw9800hCIxl8/wsd057K3
	0v3LwIyZpTA5WLkzzFZz+d9iQC2WC0lU7BW89mUytogKspxQK3/juunjH0TwmWp9/kv/aZNTrxzVy
	nPZtIQsG3SoZ3DJCaHM0r48KddjmBsSaqq4kyQJlWOJbNTwrsZHUT/ZlcHUN6LeHekEkCBF4yfSVA
	cZcox4hQ0oBVcFv0cpVqyBZoAup4uwyVzUixesGZ5oajuprKjMCrkXzX2wSKoDHqm/VxEie0kc4bV
	OHqdRwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHAs-00000009Tnn-0O6H;
	Mon, 13 Jul 2026 13:58:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHAq-00000009Tm8-3N1h
	for linux-i3c@bombadil.infradead.org;
	Mon, 13 Jul 2026 13:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=/2WZcvn6vs6I8Vw4PEeFfwOApkB0Qqs+RPBrHY59/eg=; b=b+bU6rqgQFDhVNi8IMVhW6zoIA
	2sONQfPt9rebqUASQOGeX/PKjQFM9Mf4Ig+vT8jL4cSdlo7BgylmPfYpnas/jHyfK3o3eFtKBu+Lm
	oqx3H4Fr24fFEw6+LAg5+VNpgiKObKfadeA32rDWzu24CIuewo4FEl+jizmE/faTKY48f3hQFE/jk
	acDt+7V9X9z8Af2xPfceZobhJqYPTavRIBlOG9NUPLZS3meZRNT3oXY/vbmowgjAMUI8/bSrhDuZe
	BnBDzPupYZboZ4znm5ZZAufipC2TzmaPkqXXQHHSxowLzlMB4G+tsIMxNc073UdtM6ubtB7RoyaQj
	P0j/LlrQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHAo-0000000BfvA-063I
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:58:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso14176565e9.2
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783951096; x=1784555896; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2WZcvn6vs6I8Vw4PEeFfwOApkB0Qqs+RPBrHY59/eg=;
        b=X/Vc5AZoRzWVlC/0Qrb1F9PLLr+0OR27Ui+7cHSXS98AOuTpMyI6AWr2KLJPZGU6M3
         Vxxukt5girj1A2fyc1vQ2bU4CR59kzgzi74Ms78703EimR6Z1CX/jsGmE0zy1dImWJM+
         s+wmHBTU6TGAMCb9WbVStuLaQXIjschAZ2hwGA4SEPfyvfayUmnTr/X3eCVRMfa6Sa6g
         SlzkeK3n6LpHgkKw1wINanFpdVlVAUjlYngaskwDEy6g6q9gMh8t92abg6iJap/ePJxM
         zeZc7+uqu5RK8VixPHhPLlx/k34q5HsSCGCx8oM6QqndVDOsCmV+tsyRhvgx7FmfmdEC
         SciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951096; x=1784555896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2WZcvn6vs6I8Vw4PEeFfwOApkB0Qqs+RPBrHY59/eg=;
        b=Ca3U1Kl99/t2vfvVO2pSdqNjhzsCXrgxswdpd/G7N780pR1WjlxWW8ZqVTjjHB+Sc4
         tZ/ELad1zhCqZwgow4WdEZ/XK+49aE+48oYmVUkufVY5V/OGi6rs0zGONVHysA//P41W
         p9DdTZ46RTK2x98WFDUy0nvRLofWG8xdiulhsP88jGfR1Qhi9vFEAJjWNI5UiahM+2HM
         5d5hT0Pao7G1js9EhiqQ59kjPf/iytjyCFANDBJ3bMhuwA2T8kTz9gfFiNPcBlRjjs8C
         UT9kt7qyJE533/zS0VovuNNuR2UCCeEWfKIhmDz0i9U0bIx/J64hxHQLtwUXxSDZUVN4
         vO9g==
X-Forwarded-Encrypted: i=1; AHgh+RqBI4Gfr0gMqB9I49YIwmlyvSTaNmJxpfa5iQKbCbNd7KshpKreO/YpalxkH0DwGSpeWWu0fqXRmBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRYxyE9S50XwIJC98I8zBB/ZY9vMsxqkbgQ5U8b/iNUSsfO94L
	QxnysO9BbdLZmmNJ7qrOmhyUAcgJ6mvopPpi90SWNjb9T5qc6CBZxVVIjKtFj4Bl3ik=
X-Gm-Gg: AfdE7clNDu+SiQxgpyEK4kffKtbxnK2crXz6jTyJ7AHdoipUCLid7NZHXClUhZvYmRW
	pNo01oHjENBiJXCozm7ou0YMAqgKEhrcIuPHP0xr40pw9qx+R4BmCZcEFKRXbZxspwvfHkG9sZA
	iP1uyqPk631cP9IrmTCEENWDVqcwrkP6Hg+b1d9Y9fzYbfxmHHa8qvfpWsO+4VD0IInWFp0nBJd
	XYbxcNNXhxYhPq9h8HijQME7rTyr8UAuKa/qK5AEgso2rJA50+WQ2LDA7dICtrxleUhJ0tfpVBc
	gFp6TgGWO1DJ7V3xTukmKj6AEt+6V/3XWnNNfIxWzzaNL/tsflrZrt8E9uabLZpR32+XpkbePTZ
	laOYN8IhjjYyAKZx8U9s9YMx5QwAF+HOPb0sBV44YSuNOj+dKwGubUzGfApFiFJpOcwsxrR09J2
	5VfaSohtZrklwy/Vz0RDgSmnVdkAAkkoh3vmOhFERByW/8oeAw2J/0d98sD46bhOw=
X-Received: by 2002:a05:600c:6989:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493f881de65mr90870545e9.22.1783951095834;
        Mon, 13 Jul 2026 06:58:15 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6402:500:e91e:fe5e:857b:d0c? ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb74b3edsm426933975e9.15.2026.07.13.06.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 06:58:14 -0700 (PDT)
Message-ID: <01a66774-1033-4377-a6ab-6333023ced03@tuxon.dev>
Date: Mon, 13 Jul 2026 16:58:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] i3c: Improve CCC reliability with actual_len,
 validation, and Direct GET retry
To: tze.yee.ng@altera.com, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jorge Marques <jorge.marques@analog.com>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>, Felix Gu
 <ustc.gu@gmail.com>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, imx@lists.linux.dev
References: <cover.1783493867.git.tze.yee.ng@altera.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_145818_168012_133DB8BC 
X-CRM114-Status: UNSURE (   3.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On 7/8/26 10:17, tze.yee.ng@altera.com wrote:
> Adrian Ng Ho Yin (5):
>    i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
>    i3c: master: Report actual GET CCC payload length on success
>    i3c: master: dw: Map CCC hardware errors to I3C M0/M2
>    i3c: master: Validate GET CCC payload length and retry Direct GET once
>    i3c: master: Add optional_bytes for variable-length GET CCC validation

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
