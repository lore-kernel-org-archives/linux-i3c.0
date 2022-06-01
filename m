Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B282C433F5
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Jun 2022 07:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3uR2FKfz42bed5Us62qDKUId4IsCe2Hhxd7RNt5W928=; b=qFfXEqFbi1/Sds
	RCyQnuEQ8ICEVXPbUWDbwxmLkrJbI3ZGCSNm6IZVab8PNvyLFSocdrqC2AfE0yinUUCDtMyIzXx3c
	bWpMoFsLLx7asr6Az+4CGWq9gXaP0d/mC9cpNQ9zr3uaVb09rCQUj2r5JFQoxlLLVmo8oOesPgk3j
	5vpHaDB5C7Ko983NnAtkv4cGKCep0uv7SIW/H3vy1LNE94ntxPttMMPHrXBF3dmVSw3bQKPjA16aX
	mXEai52K+zn6zBdhf49d8dN7e+kGb8EjnmLxNqYii1Mh8m0t42lmOB+AsEnI7w4Q85HG3fwbXm5pi
	SMQOTW8AjF3rxiSwhAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJFE-00EVJa-0F; Wed, 01 Jun 2022 07:58:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIzy-00ER6v-A2
	for linux-i3c@lists.infradead.org; Wed, 01 Jun 2022 07:42:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id h62-20020a1c2141000000b0039aa4d054e2so2500864wmh.1
        for <linux-i3c@lists.infradead.org>; Wed, 01 Jun 2022 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=grT2FadLkZhaPhNWlxLPz+bbGoKf4X6gH2fwHZzC5Ic=;
        b=NWF07lD0qvP5uxnFwih1JU76Y1m7R4fAY3/kx+7nYtTziG+sPDXwZmmHMbqh7ehIDc
         lk0vGkxu3P94kCWWYPm/6atvt95KupXtMNDeUk1UcPR0BJKuxpt7GSGTRR7+gxFIJwvj
         +QxmwxOmO0NkpRTsLhXvW4W/lE0jJfCtwPmHqK7jweJSUIKWtVD9eeArGUZcjnYVmqz3
         6DjwKVlfH6qEaGC0MqpFDZ7AJ/05m9E1ICVO09s1N8Mr6OQ/29VIXc2r45KMvhEpO5H1
         jdhlT+rWmv3ZkITNvCd3BYE8sFe1p9ryI7mPUMJfnfx/ULi9msTzAXAmzBU5zKYPnsdo
         L+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=grT2FadLkZhaPhNWlxLPz+bbGoKf4X6gH2fwHZzC5Ic=;
        b=x1svBjz/4NbY623onLTHSyEaoX5ZyWsLOifMLia14BVigjwxoPKexWMJXRIDOPH6xS
         hBnGUwxVyJnq+2kXndEVDexEL22muQc5UgjvK8VfgC9bQRMSxgtP0EG/w2FuxMKuS/x3
         JgGitORRWl7vMDqmTIui+dYSOZC0MFJRchP7SpHYHlix083RqPHZ4di6lXILxrN7BEMA
         HBx7SyepSObl+QJf1OwWHID09TfKzz/MeqgYf0ENIS99bCcR1ufiH3tJJgRWhk8k7OHq
         lj8KwfOlMjRob/V8uaZitQlCV+GP6VxgDc8f/PGJX1/UFuyDbZU6XklgMFIDNRod1Ky8
         bYiA==
X-Gm-Message-State: AOAM5325WcsFYoJuaalz1yl17ljRfonu3ifa5ae+OvKRzhO4MxllDCIM
	o3qKPcY/TWTvnaTdXkFEd8uOJtBU20E=
X-Google-Smtp-Source: ABdhPJxWSI5Hu27RaAgeQen5YZHQV4HIoaXVBAtRm51mH+bCPZ8WwU4rFyGDajF7hlBNz+EtHDOHCw==
X-Received: by 2002:a05:600c:4fce:b0:397:84e3:2297 with SMTP id o14-20020a05600c4fce00b0039784e32297mr25276014wmq.197.1654069349847;
        Wed, 01 Jun 2022 00:42:29 -0700 (PDT)
Received: from felia.fritz.box (200116b82620c00028af88788fa7d286.dip.versatel-1u1.de. [2001:16b8:2620:c000:28af:8878:8fa7:d286])
        by smtp.gmail.com with ESMTPSA id v19-20020a1cf713000000b0039c18d3fe27sm1034656wmh.19.2022.06.01.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 00:42:29 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify entries for some i3c drivers after dt conversion
Date: Wed,  1 Jun 2022 09:42:12 +0200
Message-Id: <20220601074212.19984-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_004234_416976_A3A82A40 
X-CRM114-Status: GOOD (  10.93  )
X-Mailman-Approved-At: Wed, 01 Jun 2022 00:58:18 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Q29tbWl0IDRiZDY5ZWNmYTY3MiAoImR0LWJpbmRpbmdzOiBpM2M6IENvbnZlcnQgY2RucyxpM2Mt
bWFzdGVyIHRvIERUCnNjaGVtYSIpIGFuZCBjb21taXQgNjc0MmNhNjIwYmQ5ICgiZHQtYmluZGlu
Z3M6IGkzYzogQ29udmVydApzbnBzLGR3LWkzYy1tYXN0ZXIgdG8gRFQgc2NoZW1hIikgY29udmVy
dCBzb21lIGkzYyBkdC1iaW5kaW5ncyB0byB5YW1sLApidXQgbWlzcyB0byBhZGp1c3QgaXRzIHJl
ZmVyZW5jZSBpbiBNQUlOVEFJTkVSUy4KCkhlbmNlLCAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIu
cGwgLS1zZWxmLXRlc3Q9cGF0dGVybnMgY29tcGxhaW5zIGFib3V0CmJyb2tlbiByZWZlcmVuY2Vz
LgoKUmVwYWlyIHRoZXNlIGZpbGUgcmVmZXJlbmNlcyBpbiBJM0MgRFJJVkVSIEZPUiBDQURFTkNF
IEkzQyBNQVNURVIgSVAgYW5kCkkzQyBEUklWRVIgRk9SIFNZTk9QU1lTIERFU0lHTldBUkUuCgpT
aWduZWQtb2ZmLWJ5OiBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3YWhuQGdtYWlsLmNvbT4KLS0t
CkFsZXhhbmRyZSwgcGxlYXNlIHBpY2sgdGhpcyBtaW5vciBub24tdXJnZW50IGNsZWFuLXVwIHBh
dGNoLiBUaGFua3MuCgogTUFJTlRBSU5FUlMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCAwMWUyNzZmYTY0NzYuLmQ1ZWE0ZWYyMjNmOCAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTkzNTQsMTMgKzkzNTQsMTMgQEAgRjoJ
ZHJpdmVycy9pMmMvaTJjLXN0dWIuYwogSTNDIERSSVZFUiBGT1IgQ0FERU5DRSBJM0MgTUFTVEVS
IElQCiBNOglQcnplbXlzxYJhdyBHYWogPHBnYWpAY2FkZW5jZS5jb20+CiBTOglNYWludGFpbmVk
Ci1GOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2NkbnMsaTNjLW1hc3Rl
ci50eHQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvY2RucyxpM2Mt
bWFzdGVyLnlhbWwKIEY6CWRyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVyLWNkbnMuYwogCiBJ
M0MgRFJJVkVSIEZPUiBTWU5PUFNZUyBERVNJR05XQVJFCiBNOglWaXRvciBTb2FyZXMgPHZpdG9y
LnNvYXJlc0BzeW5vcHN5cy5jb20+CiBTOglNYWludGFpbmVkCi1GOglEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTNjL3NucHMsZHctaTNjLW1hc3Rlci50eHQKK0Y6CURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2Mvc25wcyxkdy1pM2MtbWFzdGVyLnlhbWwKIEY6
CWRyaXZlcnMvaTNjL21hc3Rlci9kdyoKIAogSTNDIFNVQlNZU1RFTQotLSAKMi4xNy4xCgoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
