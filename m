Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB7C83F0A
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Jul 2025 22:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bihyUtMe+mBL8Lf1XHCGw8IcpBI7Ep8o/FhUORauTxQ=; b=VXfVR+higNO+4O
	gp3FQixo5LSYUh5hzkXD+kONMhDa3zh8u1OTzFCTX/anx5yaoDfquyZqS2h4CzDQuzjKtegt3M4N3
	5xCszf6HZg3HJdsYTpZvokRNzrJw8Rmo49vZyAqiVo3k5SqUyvxwwqhFQRWx73fxHPlmTSnQTGSD0
	Mq0Lqg9sG1yAz8oX6UCV84MezJSdEjw94sguZKCihq4PqG5Y2lHTnrrhV/kD4yIiQKgc7aQyQ4eRX
	yrAL0zs8veO/zgDeis5K+CDSOuS89ms5OSi/0RhkbT5ppb9vLOGHjT/bWn7WvrhiaAd81RILhecSY
	FxxkBpolsK3bgXc6KYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5bT-00000009f5V-0gp0;
	Wed, 02 Jul 2025 22:06:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvft-0000000D0tB-2V2W
	for linux-i3c@lists.infradead.org;
	Thu, 26 Jun 2025 23:06:34 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-235ef62066eso20464585ad.3
        for <linux-i3c@lists.infradead.org>; Thu, 26 Jun 2025 16:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750979192; x=1751583992; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCbQUhLpqfire/SFhHrIydc+K1fZgDEYUK8oj5zp/yg=;
        b=QKCmQTFXDwUa+4QGzs+Ut//+sqIejg1leE3iZJX7UBcjpSYr2vlL/qa2lp+E/8HP1w
         CMeOwJDTL4mvkdcXZagU+J5/prxEWEhx39DboD7mBkEOPtZ3ZWRvOKrswbamzwSxT3i5
         73azUNnCEuYahKeoAzDsa36bvEMGZh5AEe0na1cTr/iMcHYqO6ZMt7OuT0h5V7/tCeQ+
         cLgZiFwvpve5cwC2dU/LCChHd/RHhIPl2NdULcT2GBKIYR0KnWAjYOS9wjnC+moP1CWG
         G5AM6ov1CAdxxEogSJCAUQibIibgyF4jlW1xxtohevH2QtJsDj16zTyX2G6KfGbzigyF
         +Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979192; x=1751583992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCbQUhLpqfire/SFhHrIydc+K1fZgDEYUK8oj5zp/yg=;
        b=c2Lh+RHCL3U61N7v8rO6XjWxZfj0u/aobXyECPIO9h42iYdXs6am9/kdiEJ22Kc9Kb
         3lIAI/2IIKAxXiNz2pnmJFHzyeZZsiMdJF3fMgZYydUsFrKbfFWjOOKl5t5F6/KE9CHI
         Wn/2OBub1IFgK39Vkpeu7r5XPlV5F8lItVJUNzmNj3eJV+VxAI+bMhanY2R2Nlh4lg53
         0SgrHl/gnxrlGynFkCcLzw/ptkG2KgNUWQ3vfpiVQTBUmk2xBdESEs3yvdZqm3KPRaTm
         6CNP+tcLCZwmO0XamymsQG49WF6WEsilysc6eeeWVSs0Mwm0aw516HzGIN1RlaAdQuLT
         TutQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM2XNPGe5xvfsp1uGSUnlz3hKthBgr+8jW32BG/zwlD9++FOx/dpw5TxfcsQR0vsvrQ2ivqMx9fRU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyhqDyXoKBMfEadPFMvwjMUZrj7DMQlqX+3Ga6YbFTSkcSdeX4x
	ruHKRY/ZilQI0AiqdjZVkLCQ3k7mQ9BmtG03oIvbT2r35LMIyXu0buHK
X-Gm-Gg: ASbGncs92TBb4mgbvm5wQSZ99Rd1ZqnA2OTUUSbAeswQr6h4WmzIazbreippPgPBLot
	OGHFz2qAQaYzV+Ib6ihQ/2bXMfwqfBl+Lf/FIQKbQ2gmGkC0kp3jwj4hq7tCMax5DGmXyyR8Bhc
	gaxXtvzYP3pgaEEDqtevbxJIeHU/SMo+TyFx/mmFsDd5RiXNh2wImmtibGlW2wCnITU8siArIkO
	pOO0smP8aJ9UhaA9bNIZ7uItERQ9vHtuh/S5JzaGGc7MKPn3dAPtMGd1KjKqkqYSpFRqmLkNEbD
	Z3f+Z5EsN/zF7evnbVrD9/eUBDmrIcBUqoxQ8fTuDDBoEU/c6PrQcfEKXl9q6X1RzpnHxA==
X-Google-Smtp-Source: AGHT+IFvUUME0kNtua+RsrlGGMsS1fPf9D1Wos2a8zc3DvBgPZLWnsx4UrNwqvoAWLJTeloLmMk8bQ==
X-Received: by 2002:a17:903:1745:b0:234:ed31:fcb1 with SMTP id d9443c01a7336-23ac40d8b08mr10899805ad.20.1750979192313;
        Thu, 26 Jun 2025 16:06:32 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c94a8sm1308385ad.239.2025.06.26.16.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:06:31 -0700 (PDT)
Message-ID: <3fb32ef5-055d-4885-9233-a07ddcaa5154@gmail.com>
Date: Fri, 27 Jun 2025 06:06:26 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: Fix i3c_device_do_priv_xfers() return value list
To: Frank Li <Frank.li@nxp.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux i3c <linux-i3c@lists.infradead.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20250626042201.44594-1-bagasdotme@gmail.com>
 <aF17sD+4F42RL0PL@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aF17sD+4F42RL0PL@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_160633_638193_BFCF8EBF 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 02 Jul 2025 15:04:03 -0700
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

On 6/26/25 23:56, Frank Li wrote:
> On Thu, Jun 26, 2025 at 11:22:01AM +0700, Bagas Sanjaya wrote:
>> Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
>> value list:
>>
>> Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]
>>
>> Format the list as bullet list to fix the warning.
>>
>> Fixes: 0d2596508201 ("i3c: Add comment for -EAGAIN in i3c_device_do_priv_xfers()")
> 
> Needn't fixes tag here because it doesn't impact user.
> 

I found the warning on docs-next tree, though.

> subject:
> i3c: fix kernel-doc indentation of i3c_device_do_priv_xfers()
> 

Ack for the subject suggestion.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
