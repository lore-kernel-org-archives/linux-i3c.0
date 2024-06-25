Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AFDC30653
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Jun 2024 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZ7ZtPYcBZyJzAzokwiw/AOnMIl2ZPkH5I5toFyucdU=; b=z2deY4ktk0SnZ5
	bpFNMGF+dCu31YxV7vbvb6E8GIk2hcnzGZjV/2B7uGfnaERgRY/kbQmOpRtojVHkJ0HDCydDicV+Z
	vPmam3yTYONpe6qfyZMahlP/RzTOtOkMD+C37v3m2A8nMtbMrlJPjGCOWPl9oUb+d2AumwR9Vfwd5
	LMP4LEpjF43AdQMhiK0p/GeIWm2XRJjd/38/y6xr4kAl2or1cJid41f8lqUAsDdp+Me0jWWWmdQK3
	pKzjEd6QZyQqH/j8FGTjNiV+MQHXKiJRz0Us9SYB2xJVer3LcSKJayVz7zHVYtMznRLfGQR3bpjoG
	Igj9DZXKHkOg6Nr9+ZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM09I-00000001rR1-2Paj;
	Tue, 25 Jun 2024 06:59:28 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM09F-00000001rQY-1U2u
	for linux-i3c@lists.infradead.org;
	Tue, 25 Jun 2024 06:59:26 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-444fdaed647so20771cf.1
        for <linux-i3c@lists.infradead.org>; Mon, 24 Jun 2024 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719298764; x=1719903564; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aDB98kbQuG4jMhc+5/YnSzAXedCDskwQrRRjdfeVksw=;
        b=2YeY5MawzZAx/zlKV0Vkh34tJLDlLxyWR6TQ7CHhlN6sXL26loEG+ZtDsPqlbsNC51
         AqfQd8dOWtMl/wG9uChNyxaQoA7Wle9le19lJIpILBjS++9/U73Za6lJy4kt4uOcajKO
         DXthJFkjp2vqK4GHtkbnVanQ6XEpevCH0PXc8h24u6CvznC0NpGJEKFyK+giWeI/91Jq
         BSnIOQ9/QdtfAr2eg11vk1OlIJ2tr1Ej1rZAb1Yw6nqwCbh51mWNSo6i8MY5jbK8U2nP
         wUzHbgLzajS+DL/riAxqhTItaZMhmypnyPlOKgvWNsZEkubPT8iI5uP9X5YOHTEx/PAN
         DYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719298764; x=1719903564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDB98kbQuG4jMhc+5/YnSzAXedCDskwQrRRjdfeVksw=;
        b=cHTR4bqrbSXYGTn9UTjKlLGSI6wUTF6xwpwLxXqVjvxtGwXmEZqz5xevgzUSz480Xc
         DsScE2E8g3c2CgMxFlBk20KwZcSK1sTlRpmJTqrSDNUFkZRq4gDjE0Ycx5hi9F/3m3h5
         +whVKEtrSvF1CKCr/hR9ogBiEG+r4QeMidifSzfH6WXkvT5AoJ4B8VxtEKNdMe7QZDyY
         RGmfmiNRh7WVvm5zO4Q3Zdx/f0q2XrTi9tacCB0OCg6N3bMkQA8Gpxlc5SPFr721abGY
         WWkTH3X5vGY17EWazkqsoi06tZBMExDiyYAKB+us4K5T/TQwtIkB0PpgzmxyOz8vM02Y
         JZsg==
X-Forwarded-Encrypted: i=1; AJvYcCXleccX25YdR1w569JEWF+rltk3BXEmSrbbBnK4wobdId9ZcXjaeRd3mSzdkhpQ7HpIjRCWOwOXzR/8SaPaatH2wBA7dFUmO/2uzc2tfg==
X-Gm-Message-State: AOJu0YzipAVB+tLACQmX1mRClH8OTInwzNsMaedJynhZ36BwhMfJNH/d
	2P+I+5p5J5jhobiZUQF1+DNNzheeAZVBrAS+tS7Jk1SMhbTGcEd5BOw15Oyc9ra5V5QbkGFEPOZ
	aDIlDyWPPXKDUQnZnuoiUHtkwr6MLgXkT/hv1
X-Google-Smtp-Source: AGHT+IGlJT0nqE32CrXN7HXAt7RK51Q1QHp5YX2obTfJeNPoOwE90ZsgUuMGJJ3b2P0/xpgtbmKWay4QfzyN+SXaZj4=
X-Received: by 2002:a05:622a:1483:b0:444:bd5c:eb20 with SMTP id
 d75a77b69052e-444f36d473emr1441851cf.19.1719298763626; Mon, 24 Jun 2024
 23:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240624052851.1030799-1-aniketmaurya@google.com> <20240624052851.1030799-2-aniketmaurya@google.com>
 <e3160411-59e0-4806-a00d-b99564384180@linaro.org>
In-Reply-To: <e3160411-59e0-4806-a00d-b99564384180@linaro.org>
From: "Aniket ." <aniketmaurya@google.com>
Date: Tue, 25 Jun 2024 12:29:12 +0530
Message-ID: <CAMmmMt0Qd9tS3TQ0nvC_x=yskBbpTwL4o9tD5+6F8Yi1ueiG5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: dw: Add apb clock binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_235925_414354_41814473 
X-CRM114-Status: UNSURE (   6.03  )
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

> Your email still suggests mismatch with name. Please confirm that above
> this is you full name or known identity which you want to consistently
> use across all contributions. In case of doubts: please consult
> colleagues in Google (or your legal department, dunno).

Hey, my full legal name is "Aniket". Please don't mind the text in the email-id.

Thanks,
Aniket.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
