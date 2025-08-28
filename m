Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B72CA0EED
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Aug 2025 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1QB+LZ3oljDqBh3l6BTG+rR+wKB4bAjyZ1zpaVyKk2M=; b=vODbqMQ4vAULvd
	83iXV+5MS1f4Q5KPoO8uwO4tGTL3nQvbpKit7sepgO4y+5Vq5PbGgJvpabONURUA3uZFGseWGLgb9
	AxV5di+Uw160uJxpUJPm9MqYayMxutChzHTs0pUZkddqjoCYikGvmL0Ho7GIXovs6N+pg7ipXPALD
	eviDFGkyqPkXLumV+7ptXHktoStvuUQzKjyvIosFnj8XIncGPc6Bcu5Zwe5jKzoNoju1KW0iWkbmx
	ohxXaBxC1AkhgkODvg3b9lYW3oZVB5RsAx4SLfQ7FvdTSQO4KPQmal++K7MaICo1yDnvRNJABiqX4
	dB4GUyxQOvr05QJmVq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ2M-00000000z5f-3ljn;
	Thu, 28 Aug 2025 09:35:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urY3e-00000000oCi-0PFV
	for linux-i3c@lists.infradead.org;
	Thu, 28 Aug 2025 08:32:35 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b476c67c5easo503100a12.0
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756369952; x=1756974752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cMsawreydTlc4F82yKjrug0W8AgzAt83Q8ngL+wzgYQ=;
        b=d2wKg0q/AuleOLLEpJNYxgtWOz7bI0znTKnveNyViFPHmkSYDqmLqaVF6xGhkhr2qm
         LOVqrP6+FA1ZdTvUv2xjd4mtFGtF4IOjdjhUg9voX4Wh3U+pHl8mNtymIGCVLWrcaD+2
         qxjNfb6jHUMeAqlyMMcw6LiRzDB+Ne2lzvVYkTxqG2V13Za3jY7wdGuN7u/MstTe2eXy
         vrJCn5pX0mw75W0ee1B4CaBjtEWJY4/kFWipvfcIR6s9QL2zdI5mdwm/52lG3JrjT5bW
         KVQjzYZGYSDEtB/VDd74YfOwNWF1IUG72cEGA5gKCxswUg8Uwuba8/xvoLoIAEY779pE
         OCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756369952; x=1756974752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMsawreydTlc4F82yKjrug0W8AgzAt83Q8ngL+wzgYQ=;
        b=Ki7fsaz2DZ5GnUxAZrBRleCkxGJMRr2sSfHI6BfJr+L3ZIfsQC22hCF5tKrk64w9hj
         xAHQ08qYk4vJUV5B/13GxG/4saPQpUnhj5f7PnYgHADUJC8+tD1dltrUAGIn3ppISfai
         FF93QQBCvxhjq16cCcwlAt4MJOrRNBCQVtjb50i2NqIkDyYiRo+nKCdQANDR+Rf7pYRH
         SzSdGXbXXBny2H7OIEepf1Q86RuuzjHrAHLaRE+josstefimLWL/BgRaOfuitYR0ztV6
         PWJSTZPMO/PLS/T+zNxZNDgtOhIuzFuKmakBWGgtSpJN9ZYhw91ga7Pl3smgvB6M4dBB
         EV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOtfotsHSwJsKMjDupxfRPXrQJTw5lv3iTvbTQ4AJ29M/UqWwVgevUnSi2eocbMO4FeLCarJb5lw0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr4RM7fBjD1wSjm7dKjz7cRwLpDqEUZ8g/fhKyGrX8+u4yI+rJ
	2sbB/s+1lLo2KKAR7170/wf+2M/jHKOYh8kvR4yyxP2A5fNz4+DFsZTE
X-Gm-Gg: ASbGnctQ5R5X9pnggNggA3N7dehXYcn61OQosc7VwvS8JyrbWnyMPYJgN3NmAc9S/Q4
	xqrOd4/SKfDif8/Jc9EwSNMJcQ7Skk4qKx1PVHiG5htfQmlr2db7875EoJF0Jazta+XDZwTGtUF
	iOJy0Of63aqxwXoTlPqJLS+9C5aCI8aGHUIrTt14eyqoa/mmKbG5CpTi1gdhLUMcU4LJaOd1/cK
	8fOp8aGMjUYjLavi4t/HBT9Y/PWsl6q65wFq9kfJBfaEJ88BahM3dMlG8Dvr3RiCGmUrznc1UIZ
	kYXDGF0ZUGbevwZmvjVrat/MSI9PzA9A0fYSwwKnOBII5CAiRINpmC5WtshQHO7ATycDaiO/zNu
	dafMw/jWVWDdvzxNzDEfuuPWQowk1JQTcx+FN182tXIM=
X-Google-Smtp-Source: AGHT+IGww2Au6EwKzWJINCDM44/+WlrGxfz+MYGJXZ3NEBCM62zu0VwMJxkQOfq9y5AhbcTU3tjCgg==
X-Received: by 2002:a17:90b:5246:b0:321:82a0:fe50 with SMTP id 98e67ed59e1d1-3275085dabemr10455859a91.5.1756369952348;
        Thu, 28 Aug 2025 01:32:32 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fde4cecsm4335148a91.29.2025.08.28.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 01:32:31 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 0/2] i3c: master: svc: improve IBI handling
Date: Thu, 28 Aug 2025 16:32:23 +0800
Message-Id: <20250828083225.3558100-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_013234_137703_5D6D6BA1 
X-CRM114-Status: UNSURE (   5.20  )
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

Improve IBI handling to prevent certain error conditions.

Stanley Chu (2):
  i3c: master: svc: Use manual response for IBI events
  i3c: master: svc: Recycle unused ibi slot

 drivers/i3c/master/svc-i3c-master.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
