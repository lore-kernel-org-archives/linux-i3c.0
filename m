Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE05E77187
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Dec 2024 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0IE333DDjuC11kcEnkelZjZShIOccqw8g7QEa76jz0M=; b=qG2BPngeIGc+mh
	qcW89CUT6T31C9GLOOkQQpOQd4zNAL67/RwTSpd1/gE9bQayAvB4azhQw/PVKgjr9mWJ6cnweEjTZ
	2rq6n04a8WOy7Uy9X57U6voNCU9/nFTIg1yhYwLM8GmxxYMH2Wqt7KLVWwo5z92DTVnj2jMrMJ+Dm
	hXPo/6LMA68HTKvnba54bDiwT2b4AB/DeFmIbDiSsEqS04DnwrWHpLnFOV/pa6uVZSeM8+W5J81zt
	4BRryl1pBJLpqt19GYOgGtLFZzO80tjr0rMKbk5SKMVJfdVxA9V094q7RmPrtb8iPgkijuvd6uGEM
	AgRZjtQhtgLCA9kgUI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyIJ-0000000HNFX-35df;
	Wed, 18 Dec 2024 17:57:11 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyIH-0000000HNEd-3iz0
	for linux-i3c@lists.infradead.org;
	Wed, 18 Dec 2024 17:57:10 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-728e3826211so5461380b3a.0
        for <linux-i3c@lists.infradead.org>; Wed, 18 Dec 2024 09:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734544628; x=1735149428; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XO33skRYhJ5mNnhYsxpua7cUQKnThc4KxzVDaxzV2sY=;
        b=QEX7lSSwKhMDn4B39yLArVPJosOW2xqD+zZollpuoQDp7sCZs0NkrlAfGof7/IXTb9
         T+fgcSqtIu334fHa5zuY5++fD5vtaS1qTbuIlMIMuNQp2IxLVeVfWAZMEKTln0K9xPIs
         9a2Jmh/LQ/JP28MuhX+qom+sG4kFWAKJADjsP4eSoyHCA9AQxrfEe709LRMJhdj/Lkrp
         3SUINsTsrg3ACwSQQ7KdageqRUkkWG0MOVu+N29urMKZEEKambXA6LBTvJFQU3Ob+5Bd
         OFevmTXAEgx7bN67yJ15pW4H4fN0ufLd1JsQNhfNhDYqnRU3E9OYEe/mEV+6bFQY1KLn
         TrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734544628; x=1735149428;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XO33skRYhJ5mNnhYsxpua7cUQKnThc4KxzVDaxzV2sY=;
        b=GX6fJDXawE0e6cuQT0drMtvF8dDMyFhaQaDRuN0Z1aZsaa3FTwL0tcJ2BX44PtL7EE
         RogcMGOPKfnTeia3MfrTNb06tCmKPRicIOYKbEyDz9cTb5mOrWzbjQZhOqUm2UQ+ttUh
         Zu/u/8c1yin8BIynbYbLGvNkJPdKtqJuqYYHyU8eky7JDEFF3jXsqHoTnLxwio5YnlTI
         2SVEM84755icHO/3O4DQgYLPf7d93Dl9uiYHPbI6tEFY5SJ1HFp4/JTdlmmG8t9WMiXP
         PydhqUdwGmnO/6DHEpXeqY19s4MlqCN8HcCsAMcHf9DnlubNGThmWHur74C+clkcHhYA
         Yy9Q==
X-Gm-Message-State: AOJu0YyIIZHErcmJ8QrSmkv+PKHmzawWxHXGNWV0yso9zOvBXU+YSlcq
	Xwh1Na3hxRdW3ch/2SFmdn8d7qYQZFQCh/cWDTU/GpZdPm7NOK1QgKwiyg==
X-Gm-Gg: ASbGncsZkTh8jP4XBF+u38K9mPd0BbuFf+S0m3DpFiulKZdxt5RRxIZ5V9dboq0mKhV
	Hs4khcsPYl0j+G/AXIS7EgyBW32JGb4cI7rAlsf589Ck6hX9MKoDw31qLKBaFoauxCZSZBfV/t6
	+ZbZ5Z4kVPzaoMFduWKHCciluV2aVze8fuQQINnlTFw0c4NUYNpIlLWGRkEnl3s4ATRNl5oZzh4
	TAVq4pUwpine4NemL17tHVNh84e4MTwb9equb/bDmcp5RvZ1K0cVxAWMICRx5h6uyVgdKnTANzQ
	WDitDmcPzwnZxLCELowaEkOdNfygoA==
X-Google-Smtp-Source: AGHT+IEgDnkA54Exiu77zGvtIF1rRmNwyhqNBHp++ZFiLjgOh1J6kh1i+dV08H6urEkXeYhMWAoe2A==
X-Received: by 2002:a05:6a00:1787:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-72a8d24a775mr4772343b3a.15.1734544628502;
        Wed, 18 Dec 2024 09:57:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad7845sm9088254b3a.68.2024.12.18.09.57.07
        for <linux-i3c@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 09:57:07 -0800 (PST)
Message-ID: <d7ceb8fd-92fd-431b-85de-a3eae40a1981@roeck-us.net>
Date: Wed, 18 Dec 2024 09:57:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-i3c@lists.infradead.org
From: Guenter Roeck <linux@roeck-us.net>
Subject: DDR5 / SPD5118 connected to I3C bus
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_095709_934821_730A8C69 
X-CRM114-Status: UNSURE (   7.40  )
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

Hi all,

I have a series of patches which extends sdp5118 support in the Linux kernel
to I3C. Unfortunately, I don't have access to a system with I3C controller,
much less the ability to connect DDR5 memory to it.

Does anyone on this list happen to have access to such as system and would
be able and willing to test the patch series ?

Thanks,
Guenter

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
