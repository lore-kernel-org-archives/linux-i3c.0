Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B46CD484C
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Sep 2023 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IiVaO2J6+iEfgj48F3VDcj56JLp90jPOP7XMJWTBTRw=; b=rK/RBnmHfDXDzn
	BsungRY24tXEiFEHcpr77mEfIHqRQ53NagE6gAnCgKHmnyFb38Gnm0dKNoASmq7oIEs1SqdNsaIU0
	dwMtboOfagLLEK/lY5o6LWJMliOnYWucoDifzKgEG04FqUOFHZmKWl8AH9wLOsJOVeaWW2phfpLgM
	g52vTiOk19ydAgyO4X1zaWZ1js4lUPrUVqNn8xwBLZLvj16dvhtkdr8bRomRajn0PIvREN5uRZrAq
	rZ9G4WFrzECRBqDb/fo/caKY+evn//v+OuNsslFaJPL5eC6T0XXkiitoUDU+VaCZgt8kLg95pQS8h
	VkgHxzzxPdWqzat4mJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkIH-009YFn-1u;
	Fri, 22 Sep 2023 17:50:21 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkIE-009YEZ-2v
	for linux-i3c@lists.infradead.org;
	Fri, 22 Sep 2023 17:50:20 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-573c62b3cd2so1792035a12.3
        for <linux-i3c@lists.infradead.org>; Fri, 22 Sep 2023 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405017; x=1696009817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n9keGpI24f73ClY+CDWArkkyfvsmbI4ZAwNSISbMEuk=;
        b=DQVZRe3s1QaMgaGwBLOLUfjJ50Vct2KaDczpKjyPtHXqc5AjuoLNHYQdRvmMlFi/JG
         Bb812nM9kKnDmOQcmrArhBRtzWFe30j0ET9iO1N//arMrJ2/iCm355NxrHnGEix0fcOC
         rRSU5BlPfWMO/aMiE3OFQiFsjS1gR/q9Vg0y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405017; x=1696009817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9keGpI24f73ClY+CDWArkkyfvsmbI4ZAwNSISbMEuk=;
        b=SWcLwIUNW92YvZcgh3wQv7UTjkkozMcfTEI7SoUb3+iKtM5DwVTv7SfJUd7N/Ym6Y6
         L1WRnvgi8uLp7y/GVNqEAAwQxmNX2AiXMHwcDkxOxGMi+kn7Q4K1/t7AKiJbDkj/R3bq
         J42+bVvRacQteDM2D+mME5UlFbru72qn30gppP81qDXfEl/UHLK6/zUrOqvwNaXVKIjB
         Cy1ZPmwK9lSswIqjnZUhfjh9WCTQYyAOidjF7rvOUIs+Uh2OYpyNPqVorSaHvh+cEuDG
         s35d2iubykaCTiOHdm6aTVfwLCcuADpehoR3QQRau+P1sH0vgvDGfjZ3N2hXGZf47jxR
         Vjog==
X-Gm-Message-State: AOJu0YyFUaimekO2XsYtxPqdmtvF6+/0n9c1pCI9OMjTr8HFHzqS8ZMB
	5pNhXvRuuw3OffVGAJj4nIicfQ==
X-Google-Smtp-Source: AGHT+IGfcvrozhcUEUzeu1USWPMbEzqOOs271XXupxZ4a0g5Mv91RocyYCRFpFcCdsq7ZZYXC5wBrg==
X-Received: by 2002:a05:6a21:1a5:b0:130:7803:57bd with SMTP id le37-20020a056a2101a500b00130780357bdmr225662pzb.3.1695405016897;
        Fri, 22 Sep 2023 10:50:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q26-20020a62ae1a000000b0068ffd4eb66dsm3465165pff.35.2023.09.22.10.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
Cc: Kees Cook <keescook@chromium.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] i3c: master: cdns: Annotate struct cdns_i3c_xfer with __counted_by
Date: Fri, 22 Sep 2023 10:50:15 -0700
Message-Id: <20230922175014.work.637-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=keescook@chromium.org;
 h=from:subject:message-id; bh=nFAdeiJyBBAN2nKXtTbKJp+l0ifJ3TjsMbq5N6rgU9w=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPXeEDRSo/vrvPQpWyJYQlr8t8eeYkEi3JUW
 aibP2KoNw+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T1wAKCRCJcvTf3G3A
 JhqAEACFSx47UGcJAEXS4JS+FsFG8ENlzAj09y+6MUbVP+WFjPpnkap95ejxcB4GSfsDCqDxk6l
 LI+ahUhhLo96bzoYSLBN9IV/bTNp+UCcPA60RZwi1hEFT516danvY6/UgAYBXnWHjRT2mwY3odX
 yy3kqrqLDUnE3ETLmj7fMNLBhq3ZuSq/m/XUToa9/h+24FUfhzbUTBikmHvfAcveyS+RuxjO9qY
 ed0C41STALin8Mqjuy9khWvT8vR42ScDvLuGiyXsymCn/mx4I2J4ddu5LH/2IS8VU2YmaMNctjg
 ptvies9UobnLJBW8R/IZHZ04Beol8N6tigZtVT5CCdCkn8LX2w7ZwYR6ajB/A3/IaNSW5exMyyw
 /fok8hnoJA/gcVCwUm16AX3pOIbVUEDyHaFauMP6vJZ0zHV5pJOJCTylmIizWc9HTOYV0NHkpwb
 8JEjbN6xmyxxkPy2SpwEdxWpngNkl4BRwZeyOV2LFic3mtPOPfrJkhQU/qUmsdaqacHAXERuTHh
 2KPB99gvcM+fdO5CeCkrYIa+gNwDc0xfAcKIM3tL0FOVaulCGqw1bIFmIV8j6FJCbGoY+GObpnT
 xUWz5txRoRBsr0UsApv4Bsd5OFnimSTXLoSBWdriF4p1gKcvsPpxrqYI49ejrS4hjpmZDrCM3CX
 mLCiun2 ZcNO3KyQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_105018_944394_DF2C9994 
X-CRM114-Status: GOOD (  10.82  )
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

UHJlcGFyZSBmb3IgdGhlIGNvbWluZyBpbXBsZW1lbnRhdGlvbiBieSBHQ0MgYW5kIENsYW5nIG9m
IHRoZSBfX2NvdW50ZWRfYnkKYXR0cmlidXRlLiBGbGV4aWJsZSBhcnJheSBtZW1iZXJzIGFubm90
YXRlZCB3aXRoIF9fY291bnRlZF9ieSBjYW4gaGF2ZQp0aGVpciBhY2Nlc3NlcyBib3VuZHMtY2hl
Y2tlZCBhdCBydW4tdGltZSBjaGVja2luZyB2aWEgQ09ORklHX1VCU0FOX0JPVU5EUwooZm9yIGFy
cmF5IGluZGV4aW5nKSBhbmQgQ09ORklHX0ZPUlRJRllfU09VUkNFIChmb3Igc3RyY3B5L21lbWNw
eS1mYW1pbHkKZnVuY3Rpb25zKS4KCkFzIGZvdW5kIHdpdGggQ29jY2luZWxsZVsxXSwgYWRkIF9f
Y291bnRlZF9ieSBmb3Igc3RydWN0IGNkbnNfaTNjX3hmZXIuCgpbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL2tlZXMva2VybmVsLXRvb2xzL2Jsb2IvdHJ1bmsvY29jY2luZWxsZS9leGFtcGxlcy9jb3Vu
dGVkX2J5LmNvY2NpCgpDYzogIlByemVteXPFgmF3IEdhaiIgPHBnYWpAY2FkZW5jZS5jb20+CkNj
OiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+CkNjOiBs
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBLZWVzIENvb2sgPGtl
ZXNjb29rQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1j
ZG5zLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMKaW5kZXggNDk1NTFkYjcxYmM5Li45
N2MxMDEwOTU2YTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9pM2MtbWFzdGVyLWNk
bnMuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvaTNjLW1hc3Rlci1jZG5zLmMKQEAgLTM4Nyw3
ICszODcsNyBAQCBzdHJ1Y3QgY2Ruc19pM2NfeGZlciB7CiAJc3RydWN0IGNvbXBsZXRpb24gY29t
cDsKIAlpbnQgcmV0OwogCXVuc2lnbmVkIGludCBuY21kczsKLQlzdHJ1Y3QgY2Ruc19pM2NfY21k
IGNtZHNbXTsKKwlzdHJ1Y3QgY2Ruc19pM2NfY21kIGNtZHNbXSBfX2NvdW50ZWRfYnkobmNtZHMp
OwogfTsKIAogc3RydWN0IGNkbnNfaTNjX2RhdGEgewotLSAKMi4zNC4xCgoKLS0gCmxpbnV4LWkz
YyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
